class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  validates :mail, presence: true, uniqueness: true
end
