class Recipe < ApplicationRecord
  validates :name, :cuisine_id, :food_type_id, :ingredients,
            :prep_steps, :user_id, presence: true
  belongs_to :cuisine
  belongs_to :food_type
  belongs_to :user
  has_many :favorites
  enum difficulty: { easy: 1, medium: 2, hard: 3 }
  mount_uploader :picture, PictureUploader

  def favorite_by?(user)
    favorites.where(user: user).any?
  end
end
