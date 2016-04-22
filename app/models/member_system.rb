class MemberSystem < ActiveRecord::Base
  extend Enumerize
  enumerize :enable, in: {:enable => 'true' , :anenable => 'false'}

  belongs_to :user
  belongs_to :member_role

  default_scope { where("member_systems.deleted_at IS NULL") }

  #対象者の全レコード
  scope :get_mylist, ->(user_id) { where(user_id: user_id).order(started_on: :desc) }
  #対象者の現時点で有効なレコード
  scope :get_mylist_active, ->(user_id) { where(user_id: user_id).where('started_on <=?', Date.current ).where('ended_on >=?',Date.current).first }
  #対象者の特定の終了日のレコード
  scope :get_mylist_day, ->(user_id,day) { where(user_id: user_id).where(ended_on: day).first }

end
