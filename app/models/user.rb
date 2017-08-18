class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :profile_img, ImgUploader

  has_many :posts
  has_many :likes

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /@/
  validates :password, presence: true
  validates_length_of :password, minimum: 6

  def valid_profile_img
    if self.profile_img.present?
      self.profile_img
    else
      'user.png'
    end
  end
end
