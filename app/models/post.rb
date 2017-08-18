class Post < ApplicationRecord
  mount_uploader :img_path, ImgUploader

  belongs_to :user
  has_many :likes
  has_many :comments

  def has_like(user)
    self.likes.where(user_id: user.id).count != 0
  end

  def like(user)
    Like.create(post: self, user: user)
  end

  def cancel_like(user)
    self.likes.where(user_id: user.id).destroy_all
  end

  def like_toggle(user)
    if has_like(user)
      cancel_like(user)
    else
      like(user)
    end
  end

  def add_comment(user, contents)
    Comment.create( post: self, user: user, contents: contents)
  end
end
