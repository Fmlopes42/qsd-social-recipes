require 'rails_helper'

feature 'User see recipes list' do
  scenario 'succesfully' do
  user = create(:user)
  food_type = create(:food_type)
  cuisine = create(:cuisine)

  recipe = create(:recipe, cuisine: cuisine, food_type: food_type, user: user)
  another_recipe = create(:recipe, name: "Feijão", cuisine: cuisine,
                          food_type: food_type, prep_time: 30, serves: 5,
                          difficulty: 1, ingredients: "Àgua e feijão",
                          prep_steps: "Vish", user: user)

  visit root_path

  expect(page).to have_content recipe.name
  expect(page).to have_content recipe.cuisine.name
  expect(page).to have_content recipe.food_type.name
  expect(page).to have_content recipe.prep_time
  expect(page).to have_content recipe.serves
  expect(page).to have_content recipe.difficulty.humanize
  expect(page).to have_content recipe.ingredients
  expect(page).to have_content recipe.prep_steps

  expect(page).to have_content another_recipe.name
  expect(page).to have_content another_recipe.cuisine.name
  expect(page).to have_content another_recipe.food_type.name
  expect(page).to have_content another_recipe.prep_time
  expect(page).to have_content another_recipe.serves
  expect(page).to have_content another_recipe.difficulty.humanize
  expect(page).to have_content another_recipe.ingredients
  expect(page).to have_content another_recipe.prep_steps

  end
end
