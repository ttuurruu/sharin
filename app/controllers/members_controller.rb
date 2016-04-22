class MembersController < ApplicationController
  include Member,Common
  before_action :set_member_menu, only: [:profile]
  before_action :set_view, only: [:profile]


  ################# メンバープロフィール  #################

  def profile

    #leftside
    @user = User.find(params[:id])

    ##details
    record = MemberTable.where(id: params[:member_table_id]).first
    #ナビゲーション
    @function = record
    @category = MemberTable.where(hierarchy_level: 1).where(category: record.category).first
    #param
    @user_id = params[:id]

    #対象リスト
    @records = record.model.constantize.get_mylist(params[:id])

  end

end