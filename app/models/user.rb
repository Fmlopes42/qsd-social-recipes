class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  has_many :favorites
  validates :mail, presence: true, uniqueness: true
end
