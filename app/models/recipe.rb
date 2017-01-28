class Recipe < ApplicationRecord
  belongs_to :cuisine
  enum difficulty: { easy: 1, medium: 2, hard: 3 }
end
