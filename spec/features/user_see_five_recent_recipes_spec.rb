require 'rails_helper'

feature 'User see five recent recipes' do
  scenario 'succesfully' do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    user = create(:user)

    recipe = create(:recipe, cuisine: cuisine, food_type: food_type, user: user)
    recipe2 = create(:recipe, name: 'Bolo_2', cuisine: cuisine,
                              food_type: food_type, user: user)
    recipe3 = create(:recipe, name: 'Bolo_3', cuisine: cuisine,
                              food_type: food_type, user: user)
    recipe4 = create(:recipe, name: 'Bolo_4', cuisine: cuisine,
                              food_type: food_type, user: user)
    recipe5 = create(:recipe, name: 'Bolo_5', cuisine: cuisine,
                              food_type: food_type, user: user)
    recipe6 = create(:recipe, name: 'Bolo_6', cuisine: cuisine,
                              food_type: food_type, user: user)
    recipe7 = create(:recipe, name: 'Bolo_7', cuisine: cuisine,
                              food_type: food_type, user: user)

    visit root_path

    expect(page).not_to have_content recipe.name
    expect(page).not_to have_content recipe2.name

    within('section#recipes') do
      expect(page).to have_content recipe3.name
      expect(page).to have_content recipe4.name
      expect(page).to have_content recipe5.name
      expect(page).to have_content recipe6.name
      expect(page).to have_content recipe7.name
    end
  end
end
