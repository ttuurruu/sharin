class UsersController < ApplicationController
  include Common
  before_action :set_view, only: [:new]
  before_action :set_user, only: [ :edit, :update, :delete, :password_reset, :password_reset_update, :setting_password, :password_change_update, :setting_profile, :account_update]

  def index
    @member_tables_category = MemberTable.where(hierarchy_level: 1)
    @member_tables_function = MemberTable.where(hierarchy_level: 2)

    @q = User.order(code: :asc).search(params[:q])
    @users = @q.result(distinct: true).page(params[:page])

  end

  def new
    @record = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save

      #user_passwordテーブルを作成
      user_password = UserPassword.new
      user_password.user_id = @user.id
      user_password.password = UserPassword.encrypt(params[:password])
      user_password.save

      #user_imageテーブルを作成
      user_image = UserImage.new
      user_image.user_id = @user.id
      user_image.image = params[:image]
      user_image.use = 1
      user_image.save

      #member_nameテーブルを作成
      member_name = MemberName.new
      member_name.user_id = @user.id
      member_name.started_on = "1900-01-01"
      member_name.ended_on = "2099-12-31"
      member_name.name = params[:name]
      member_name.save

      #member_systemテーブルを作成
      #1900-1-1から利用開始日前日までの無効のレコード
      member_system = MemberSystem.new
      member_system.user_id = @user.id
      member_system.started_on = "1900-01-01"
      day = Date.parse(params[:use_start])
      member_system.ended_on = day - 1
      member_system.enable = false
      member_system.save
      #利用開始日から有効のレコードを作成
      member_system = MemberSystem.new
      member_system.user_id = @user.id
      member_system.started_on = params[:use_start]
      member_system.ended_on = "2099-12-31"
      member_system.member_role_id = 1
      member_system.save

      #member_communicationテーブルを作成
      member_communication = MemberCommunication.new
      member_communication.user_id = @user.id
      member_communication.save

      flash[:notice] = t('message.save')
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = t('message.update')
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def delete
    @user.deleted_at = Time.now
    @user.save
    flash[:notice] = '削除しました。'
    redirect_to action: 'index'
  end

  ############自分自身のアカウント登録###################
  def activate
    #メールアドレスチェック
    if User.email_check(params[:email],params[:key])  then
      #未登録の場合、セッションにemailを格納し、user登録画面に遷移
      session[:email] = params[:email]
      redirect_to action: :account_new
    else
      #エラー画面を表示
      render :activate
    end
  end

  def account_new
    @user = User.new
  end

  def account_create
    @user = User.new(user_params)
    @user.email = session[:email]
    if @user.save
      redirect_to action: 'account_finish'
    else
      render :account_new
    end
  end

  def account_finish
    reset_session
  end

  ############パスワード変更メールからのパスワード変更###################
  def password_reset_check
    #メールアドレスチェック
    if User.email_check(params[:email],params[:key])  then
      #該当のアドレスがない場合、エラー画面を表示
      render :password_reset_error
    else
      #セッションにuser_idを格納し、パスワード再設定画面に遷移
      @user = User.where(email: params[:email]).first
      session[:user_id] = @user.id
      redirect_to action: 'password_reset',id: @user.id
    end
  end
  def password_reset
  end
  def password_reset_update
    if @user.update(user_params)
      redirect_to action: 'password_reset_finish'
    end
  end
  def password_reset_finish
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
        :code,
        :email,
        :image,
        :image_cache,
        :remove_image,
    )
  end
end
