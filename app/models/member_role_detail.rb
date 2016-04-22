class MemberRoleDetail < ActiveRecord::Base
  belongs_to :member_role

  default_scope { where("member_role_details.deleted_at IS NULL") }

end
