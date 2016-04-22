class Register
  include ActiveModel::Model
  attr_accessor  :email ,:agreement

  validates :email,
            presence: true
  validates :agreement,
            acceptance: true
end