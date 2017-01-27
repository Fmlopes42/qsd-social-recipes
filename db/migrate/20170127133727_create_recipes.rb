class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :kitchen
      t.string :food_type
      t.integer :serves
      t.integer :prep_time
      t.text :ingredients
      t.text :prep_steps

      t.timestamps
    end
  end
end
