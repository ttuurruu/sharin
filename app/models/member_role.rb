class MemberRole < ActiveRecord::Base

  has_many :member_role_details
  has_many :member_systems

end
