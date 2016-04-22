class LoginController < ApplicationController
  include Common
  before_action :set_view, only: [:index]
  skip_before_action :check_logined
  layout 'login'

  def index
    @record = Login.new
  end

  #Userログインチェック
  def auth
    #codeをもとにUserを取得
    user = User.find_by(code: params[:login][:code])
    #userを元に有効なパスワードを取得
    user_password = UserPassword.get_password(user.id)

    #取得したuser情報を元にpasswordチェック
    unless user && user_password == params[:password]
       #Userテーブルから対象の値が取れなかった場合
       reset_session
       #login画面にエラーを表示
       flash[:error] = t('message.login_error')
       redirect_to login_path
    else
      #Userテーブルから対象の値が取れた場合
      member_system = MemberSystem.get_mylist_active(user.id)
      if member_system.enable

        #セッションの初期化
        reset_session

        #セッションにユーザ情報をセット
        session[:user_id] = user.id
        session[:code] = user.code
        member_name = MemberName.get_mylist_active(user.id)
        session[:user_name] = member_name.name
        session[:image] = UserImage.get_user_image_url(user.id)
        #権限情報をセット
        session[:member_role_id] = member_system.member_role_id
        session[:system_admin] = member_system.system_admin

        # ダッシュボードに遷移
        redirect_to controller: 'homes', action: 'user'

      else
        reset_session
        #login画面にエラーを表示
        flash[:error] = t('message.account_error')
        redirect_to login_path
      end

    end
  end

  #ログアウト
  def logout
    #セッション情報を破棄
    reset_session
  end

end
