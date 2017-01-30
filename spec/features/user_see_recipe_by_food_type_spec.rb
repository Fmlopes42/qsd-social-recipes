require 'rails_helper'

feature 'User see recipe by food type' do
  scenario 'successfully' do
    cuisine = create(:cuisine)
    food_type = create(:food_type)
    recipe = create(:recipe, cuisine: cuisine, food_type: food_type)

    visit root_path
    click_on recipe.food_type.name

    expect(page).to have_content food_type.name

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.serves
    expect(page).to have_content recipe.prep_time
    expect(page).to have_content recipe.difficulty.humanize
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.prep_steps

  end
end
