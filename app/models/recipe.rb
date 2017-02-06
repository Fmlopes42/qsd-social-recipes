class Recipe < ApplicationRecord
  validates :name, :cuisine_id, :food_type_id, :ingredients,
            :prep_steps, presence: true
  belongs_to :cuisine
  belongs_to :food_type
  enum difficulty: { easy: 1, medium: 2, hard: 3 }
  mount_uploader :picture, PictureUploader
end
