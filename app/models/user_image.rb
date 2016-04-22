class UserImage < ActiveRecord::Base

  belongs_to :user

  mount_uploader :image, ImageUploader

  default_scope { where("user_images.deleted_at IS NULL") }

  #対象者の有効なプロフィール画像のＵＲＬを取得
  def self.get_user_image_url(user_id)
    user_image = UserImage.where(user_id: user_id).where(use: 1).first
    if user_image.image.blank?
      "noimage5050.png"
    else
      user_image.image.url
    end
  end

end
