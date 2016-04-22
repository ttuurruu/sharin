class MemberCommunicationsController < ApplicationController
  include Member
  before_action :set_member_menu, only: [:index]
  before_action :set_member_communication, only: [:show, :edit, :update]

  def index

    #検索条件生成


    #検索フォーム
    if params[:q].blank?
      #初回ロード時
      @q = MemberCommunication.order(updated_at: :desc).ransack(params[:q])
    else
      #検索実行時
      @q = MemberCommunication.order(updated_at: :desc).ransack(params[:q])
    end

    #結果表示
    @results = @q.result(distinct: true).page(params[:page])
    @member_table = MemberTable.where(controller: "member_communications").first

    @condition = "email1_cont"

  end

  def show
  end

  def edit
    @id = params[:id]
    @member_table = MemberTable.where(controller: "member_communications").first
    @table_settings = TableSetting.get_input_list('member_communications')

  end

  def cancel_edit
    @id = params[:id]
  end

  def update

      if @member_communication.update(member_communication_params)

        flash[:notice] = t('message.update')

        record = MemberTable.where(controller: "member_communications").first
        @function = record
        @category = MemberTable.where(hierarchy_level: 1).where(category: record.category).first
        @table_settings = TableSetting.get_list('member_communications')

      else
        render :edit
      end
  end

  private
    def set_member_communication
      @member_communication = MemberCommunication.find(params[:id])
    end

    def member_communication_params
      params.require(:member_communication).permit(:email_office1, :email_office2, :email_personal1, :email_personal2, :phone_office, :phone_personal, :phone_home, :extended_number, :fax_number, :system_id1, :system_id2, :system_id3, :google, :facebook, :twitter, :skype, :slack, :github, :linkedin, :dropbox, :instagram, :paypal, :pinterest, :slideshare, :stack_overflow, :trello, :tumblr, :youtube, :line, :hipchat, :chatwork, :qiita, :esa)
    end
end
