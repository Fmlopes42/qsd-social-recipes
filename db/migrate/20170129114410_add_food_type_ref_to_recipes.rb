class AddFoodTypeRefToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :food_type, foreign_key: true
  end
end
