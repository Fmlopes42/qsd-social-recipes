class Recipe < ApplicationRecord
  validates :name, :cuisine_id, :food_type_id, :ingredients,
            :prep_steps, :user_id, presence: true
  belongs_to :cuisine
  belongs_to :food_type
  belongs_to :user
  has_many :favorites
  enum difficulty: { easy: 1, medium: 2, hard: 3 }
  mount_uploader :picture, PictureUploader

  def is_favorite?(user)
    self.favorites.where(:user_id == user).any?
  end

  def favorited_by(user)
    favorites.where(:user_id == user && :recipe_id == self)
  end
end
