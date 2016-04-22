class User < ActiveRecord::Base

  has_many :evaluation_settings
  has_many :evaluation_evaluators

  has_many :member_communications
  has_many :member_names
  has_many :member_systems

  has_many :user_images
  has_many :user_passwords

  default_scope { where("users.deleted_at IS NULL") }

  def encrypt_password
    self.password = encrypt(self.password)
  end

  # SECUREは短いとエラーを吐く
  SECURE = 'lsfgsjhostsgpfsksjdhgisgunkgosugsfgsofgfoss'
  CIPHER = 'aes-256-cbc'

  # 暗号化
  def self.encrypt(key)
    crypt = ActiveSupport::MessageEncryptor.new(SECURE, CIPHER)
    key = crypt.encrypt_and_sign(key)
  end

  # 複合化
  def self.decrypt(key)
    crypt = ActiveSupport::MessageEncryptor.new(SECURE, CIPHER)
    key2 = crypt.decrypt_and_verify(key)
  end

  # メールアドレスチェック
  def self.email_check(email,key)
    if email == decrypt(key) && User.find_by(email: email) == nil then
      true
    else
      false
    end
  end

end
