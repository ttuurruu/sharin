module ApplicationHelper

  #有効なメンバー名を取得
  def get_member_name(user_id)
    record = MemberName.get_mylist_active(user_id)
    "#{record.name}"
  end
  #メンバープロフィール画像を取得
  def get_user_image(user_id)
    record = UserImage.get_user_image_url(user_id)
  end


  def get_table_setting(table_name,column_name)
    table_setting = TableSetting.where(form_type: 1).where(table_name: table_name ).where(column_name: column_name).first
  end

  #権限設定内容を取得
  def get_member_role_detail(member_role_id, member_table_id)
    member_role_details = MemberRoleDetail.where(member_role_id: member_role_id ).where(id: member_table_id).first
    unless member_role_details.blank?
      @member_role_details = member_role_details
    end
  end
  def get_member_role_detail_scope_type(value)
    case value
      when 1 then "同じ所属"
      when 2 then "同じグループ"
      when 3 then "全員"
    end
  end
  def get_member_role_detail_level_type(value)
    case value
      when 1 then "配下"
      when 2 then "同列まで"
      when 3 then "全員"
    end
  end
  def get_member_role_detail_time_type(value)
    case value
      when 1 then "過去～現在"
      when 2 then "現在のみ"
      when 3 then "現在～未来"
      when 4 then "全て"
    end
  end
  def get_member_role_detail_crud_type(value)
    case value
      when 1 then "参照のみ"
      when 2 then "編集可能"
    end
  end

end