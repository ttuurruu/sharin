module Member extend ActiveSupport::Concern

  def set_member_menu
    #ヘッダーメニュー
    @member_role_details = MemberRoleDetail.where(member_role_id: session[:member_role_id])
    #function
    @in_string = Array.new(0, nil)
    @member_role_details.each do |member_role_detail|
      @in_string.push(member_role_detail.id)
    end
    @member_tables_function = MemberTable.where(hierarchy_level: 2).where('id IN(?)', @in_string)

    #category
    @in_string2 = Array.new(0, nil)
    @member_tables_function.each do |member_tables_function|
      @in_string2.push(member_tables_function.category)
    end
    @member_tables_category = MemberTable.where(hierarchy_level: 1).where('category IN(?)', @in_string2)
  end

  #履歴型
  def set_member_list(user_id,model)
    #ヘッダー
    @user_id = user_id
    record = MemberTable.where(model: model).first
    @function = record
    @category = MemberTable.where(hierarchy_level: 1).where(category: record.category).first

    #対象リスト
    @table_settings = TableSetting.get_list(record.controller)
    @records = model.constantize.get_mylist(user_id)
  end

end