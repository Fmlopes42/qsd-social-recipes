require 'rails_helper'

feature 'User see recipe by cuisine' do
  scenario 'successfully' do

    cuisine = create(:cuisine)
    recipe = create(:recipe, cuisine: cuisine)

    visit root_path

    click_on cuisine.name

    expect(page).to have_content recipe.cuisine.name
    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.food_type
    expect(page).to have_content recipe.serves
    expect(page).to have_content recipe.prep_time
    expect(page).to have_content recipe.difficulty.humanize
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.prep_steps
  end
end
