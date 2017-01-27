class Recipe < ApplicationRecord
    enum difficulty: { easy: 1, medium: 2, hard: 3 }
end
