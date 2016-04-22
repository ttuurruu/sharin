class MemberCommunication < ActiveRecord::Base

  belongs_to :user

  #対象者の全レコード
  scope :get_mylist, ->(id) { where(user_id: id).first }

end
