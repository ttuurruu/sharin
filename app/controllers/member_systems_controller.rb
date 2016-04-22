class MemberSystemsController < ApplicationController
  include Member,Common
  before_action :set_member_menu, only: [:index]
  before_action :set_view, only: [:index]

  before_action :set_member_system, only: [:show, :edit, :update, :destroy]

  def index

    #検索フォーム
    if params[:q].blank?
      #初回ロード時
      @q = MemberSystem.order(updated_at: :desc).where(updated_status: [1,2] ).ransack(params[:q])
    else
      #検索実行時
      @q = MemberSystem.order(updated_at: :desc).ransack(params[:q])
    end

    #結果表示
    @results = @q.result(distinct: true).page(params[:page])
    @member_table = MemberTable.where(controller: "member_systems").first

  end

  def new

    @forms = ConfigView.where(id: 3).first
    @form_columns = ConfigFormColumn.get_visible_column(3)
    @form_footers = ConfigFormFooter.where(form_id: 3)

    @record = MemberSystem.new

    #最新レコードを取得し、フォーム上の初期値をセット
    record_old = MemberSystem.get_mylist_day(params[:user_id],'2099-12-31')
    table_settings_value = TableSetting.get_list_value('member_system')
    table_settings_value.each do |table_setting|
      @record["#{table_setting.column_name}"] = record_old["#{table_setting.column_name}"]
    end
    @record.started_on = Date.parse(@record.started_on.to_s) + 1

  end

  def create
    ##新規登録
    @member_system = MemberSystem.new(member_system_params)
    @member_system.updated_status = 1
    @member_system.updated_user = session[:user_id]

    ##レコード作成
    #1.更新前の最新履歴を取得
    update_record = MemberSystem.get_mylist_day(params[:member_system][:user_id],'2099-12-31')

    #2.新規レコード追加
    @member_system.save

    #3.1で取得したレコードの終了日を更新
    day = Date.parse(params[:member_system][:started_on])
    update_record.ended_on = day - 1
    update_record.updated_user = session[:user_id]
    update_record.save

    ##ページ再表示
    flash[:notice] = t('message.save')
    set_member_list(params[:member_system][:user_id],"MemberSystem")

  end

  def cancel
  end

  def cancel_edit
    @id = params[:id]
  end

  def edit

    @forms = ConfigView.where(id: 4).first
    @form_columns = ConfigFormColumn.get_visible_column(4)
    @form_footers = ConfigFormFooter.where(config_view_id: 4)

    @id = params[:id]
    @member_table = MemberTable.where(controller: "member_systems").first
    record = MemberSystem.find(params[:id])
    @record_old = MemberSystem.get_mylist_day(@record.user_id,record.started_on - 1)

    @user_id = @record.user_id
    @table_settings = TableSetting.get_list_input('member_system')

  end

  def show
    @id = params[:id]
  end

  def update

    ##レコード更新
    #更新前のレコードを取得し、開始日の変更有無を確認
    before_record = MemberSystem.find(params[:id])

    #対象レコードの更新
    @record.updated_status = 2
    @record.update(member_system_params)

    ##開始日に変更がある場合は前のレコードの終了日を合わせて更新
    unless before_record.started_on == Date.parse(params[:member_system][:started_on])
      #対象レコードを取得
      day = before_record.started_on - 1
      update_record = MemberSystem.get_mylist_day(params[:member_system][:user_id],day)
      #終了日を更新
      update_day = Date.parse(params[:member_system][:started_on]) - 1
      update_record.ended_on = update_day
      update_record.updated_status = 4
      update_record.updated_user = session[:user_id]
      update_record.save
    end

    ##ページ再表示
    flash[:notice] = t('message.update')
    set_member_list(params[:member_system][:user_id],"MemberSystem")

  end

  def destroy
    ##削除処理

    #1つ前の履歴の終了日を無期限に変更
    day = Date.parse(@record.started_on.to_s) - 1
    update_record = MemberSystem.get_mylist_day(@record.user_id,day)
    update_record.ended_on = '2099-12-31'
    update_record.updated_status = 4
    update_record.updated_user = session[:user_id]
    update_record.save

    #対象レコードを削除
    @record.updated_status = 3
    @record.updated_user = session[:user_id]
    @record.deleted_at = Time.now
    @record.save

    ##ページ再表示
    flash[:notice]  = t('message.delete')
    set_member_list(@record.user_id,"MemberSystem")

  end

  private
    def set_member_system
      @record = MemberSystem.find(params[:id])
    end

    def member_system_params
      params.require(:member_system).permit(:user_id, :started_on, :ended_on, :enable, :member_role_id, :memo, :deleted_at)
    end
end
