class Recipe < ApplicationRecord
  validates :name, :cuisine_id, :food_type, :ingredients,
            :prep_steps, presence: true
  belongs_to :cuisine
  enum difficulty: { easy: 1, medium: 2, hard: 3 }
  mount_uploader :picture, PictureUploader
end
