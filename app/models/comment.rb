class Comment < ApplicationRecord
  belongs_to :Post
  belongs_to :User
end
