require "rails_helper"

feature "User see five recent recipes" do
  scenario "succesfully" do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    recipe = create(:recipe, cuisine: cuisine, food_type: food_type)
    recipe_2 = create(:recipe, name: "Bolo_2", cuisine: cuisine,
                      food_type: food_type)
    recipe_3 = create(:recipe, name: "Bolo_3", cuisine: cuisine,
                      food_type: food_type)
    recipe_4 = create(:recipe, name: "Bolo_4", cuisine: cuisine,
                      food_type: food_type)
    recipe_5 = create(:recipe, name: "Bolo_5", cuisine: cuisine,
                      food_type: food_type)
    recipe_6 = create(:recipe, name: "Bolo_6", cuisine: cuisine,
                      food_type: food_type)
    recipe_7 = create(:recipe, name: "Bolo_7", cuisine: cuisine,
                      food_type: food_type)

    visit root_path

    expect(page).not_to have_content recipe.name
    expect(page).not_to have_content recipe_2.name

    within("section#recipes") do
      expect(page).to have_content recipe_3.name
      expect(page).to have_content recipe_4.name
      expect(page).to have_content recipe_5.name
      expect(page).to have_content recipe_6.name
      expect(page).to have_content recipe_7.name
      expect(page).to have_content recipe.food_type.name
      expect(page).to have_content recipe.serves
      expect(page).to have_content recipe.prep_time
      expect(page).to have_content recipe.difficulty.humanize
      expect(page).to have_content recipe.ingredients
      expect(page).to have_content recipe.prep_steps
    end

  end
end
