class MemberNamesController < ApplicationController
  include Member
  before_action :set_member_menu, only: [:index]
  before_action :set_member_name, only: [:edit, :update, :destroy]

  def index

    #検索フォーム
    if params[:q].blank?
      #初回ロード時
      @q = MemberName.order(updated_at: :desc).where(updated_status: [1,2] ).ransack(params[:q])
    else
      #検索実行時
      @q = MemberName.order(updated_at: :desc).ransack(params[:q])
    end

    #結果表示
    @results = @q.result(distinct: true).page(params[:page])
    @member_table = MemberTable.where(controller: "member_names").first

  end

  def new

    @user_id = params[:user_id]
    @table_settings = TableSetting.get_input_list('member_names')

    record_old = MemberName.get_mylist_day(params[:user_id],'2099-12-31')
    @record = MemberName.new
    @table_settings.each do |table_setting|
      @record["#{table_setting.column_name}"] = record_old["#{table_setting.column_name}"]
    end
    @record.started_on = Date.parse(@record.started_on.to_s) + 1

  end

  def create
    ##新規登録
    @member_name = MemberName.new(member_name_params)
    @member_name.updated_status = 1
    @member_name.updated_user = session[:user_id]

    ##レコード作成
    #1.更新前の最新履歴を取得
    update_record = MemberName.get_mylist_day(params[:member_name][:user_id],'2099-12-31')

    #2.新規レコード追加
    @member_name.save

    #3.1で取得したレコードの終了日を更新
    day = Date.parse(params[:member_name][:started_on])
    update_record.ended_on = day - 1
    update_record.updated_user = session[:user_id]
    update_record.save

    ##ページ再表示
    flash[:notice] = t('message.save')
    set_member_list(params[:member_name][:user_id],"member_names")

  end

  def cancel
  end

  def cancel_edit
    @id = params[:id]
  end

  def edit

    @id = params[:id]
    @member_table = MemberTable.where(controller: "member_names").first
    record = MemberName.find(params[:id])
    @record_old = MemberName.get_mylist_day(@record.user_id,record.started_on - 1)

    @user_id = @record.user_id
    @table_settings = TableSetting.get_input_list('member_names')

  end

  def update

    ##レコード更新
    #更新前のレコードを取得し、開始日の変更有無を確認
    before_record = MemberName.find(params[:id])

    #対象レコードの更新
    @record.updated_status = 2
    @record.update(member_name_params)

    ##開始日に変更がある場合は前のレコードの終了日を合わせて更新
    unless before_record.started_on == Date.parse(params[:member_name][:started_on])
      #対象レコードを取得
      day = before_record.started_on - 1
      update_record = MemberName.get_mylist_day(params[:member_name][:user_id],day)
      #終了日を更新
      update_day = Date.parse(params[:member_name][:started_on]) - 1
      update_record.ended_on = update_day
      update_record.updated_status = 4
      update_record.updated_user = session[:user_id]
      update_record.save
    end

    ##ページ再表示
    flash[:notice] = t('message.update')
    set_member_list(params[:member_name][:user_id],"member_names")

  end

  def destroy
    ##削除処理

    #1つ前の履歴の終了日を無期限に変更
    day = Date.parse(@record.started_on.to_s) - 1
    update_record = MemberName.get_mylist_day(@record.user_id,day)
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
    set_member_list(@record.user_id,"member_names")

  end

  def csv
    set_member_list(params[:user_id],"member_names")
    respond_to do |format|
      format.csv do
        send_data MemberName.to_csv(@member_names),
                  type: 'text/csv; charset=shift_jis',
                  filename: "member_name-#{Time.now.to_date.to_s}.csv",
                  type: :csv
      end
    end
  end

  private

  def set_member_name
    @record = MemberName.find(params[:id])
  end
  def member_name_params
    params.require(:member_name).permit(:user_id, :started_on, :ended_on, :name, :name_katakana, :name_romaji, :register, :register_katakana, :register_romaji, :memo)
  end

end