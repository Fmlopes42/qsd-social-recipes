require 'rails_helper'

feature 'User see recipe by cuisine' do
  scenario 'successfully' do
    user = create(:user)
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    recipe = create(:recipe, cuisine: cuisine, food_type: food_type, user: user)

    visit root_path

    click_on cuisine.name

    within('section#cuisine') do
      expect(page).to have_content cuisine.name
    end

    within('section#recipes') do
      expect(page).to have_content recipe.name
      expect(page).to have_content recipe.food_type.name
      expect(page).to have_content recipe.serves
      expect(page).to have_content recipe.prep_time
      expect(page).to have_content recipe.difficulty.humanize
    end
  end
end
