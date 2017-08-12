class Post < ApplicationRecord
  mount_uploader :img_path, ImgUploader

  belongs_to :user
end
