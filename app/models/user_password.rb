class UserPassword < ActiveRecord::Base
  belongs_to :user

  #対象者の有効なパスワード
  def self.get_password(id)
    #userを元に有効なパスワードを取得
    user_password = UserPassword.where(user_id: id).order(id: :desc).first
    #パスワードを複合化
    UserPassword.decrypt(user_password.password)
  end

  # SECUREは短いとエラーを吐く
  SECURE = 'lsfgsjhostsgpfsksjdhgisgunkgosugsfgsofgfoss'
  CIPHER = 'aes-256-cbc'

  # 暗号化
  def self.encrypt(key)
    crypt = ActiveSupport::MessageEncryptor.new(SECURE, CIPHER)
    crypt.encrypt_and_sign(key)
  end

  # 複合化
  def self.decrypt(key)
    crypt = ActiveSupport::MessageEncryptor.new(SECURE, CIPHER)
    crypt.decrypt_and_verify(key)
  end

end