class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /@/
  validates :password, presence: true
  validates_length_of :password, minimum: 6
end
