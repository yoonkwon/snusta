class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :profile_img, ImgUploader

  has_many :posts
  has_many :likes
  has_many :followers, class_name: 'Relationship', dependent: :destroy
  has_many :followings, class_name: 'Relationship', dependent: :destroy

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

  def unfollow(user)
    Relationship.where(follower: self, following: user).destroy_all
  end

  def following?(user)
    Relationship.find_by(follower: self, following: user).present?
  end

  def follow_toggle(user)
    if following?(user)
      unfollow(user)
    else
      Relationship.create(follower: self, following: user)
    end
  end
end
