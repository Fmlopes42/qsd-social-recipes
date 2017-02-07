require 'rails_helper'

feature 'User search recipe' do
  scenario 'successfully' do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    user = create(:user)
    recipe = create(:recipe, food_type: food_type, cuisine: cuisine, user: user)
    another_recipe = create(:recipe, name: 'Miojo com ovo',
                                     food_type: food_type, cuisine: cuisine,
                                     user: user)

    recipe_search = 'Miojo'

    visit root_path

    fill_in 'Buscar Receita', with: recipe_search

    click_on 'Buscar'

    expect(page).to have_content recipe.name
    expect(page).to have_content another_recipe.name
  end
end

feature 'User search recipe from any page' do
  scenario 'successfully' do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    user = create(:user)
    recipe = create(:recipe, food_type: food_type, cuisine: cuisine, user: user)
    another_recipe = create(:recipe, name: 'Feijoada', food_type: food_type,
                                     cuisine: cuisine, user: user)

    recipe_search = 'Miojo'
    another_recipe_search = 'Feijoada'

    visit cuisine_path(cuisine)
    fill_in 'Buscar Receita', with: recipe_search
    click_on 'Buscar'
    expect(page).to have_content recipe.name

    visit food_type_path(food_type)
    fill_in 'Buscar Receita', with: recipe_search
    click_on 'Buscar'
    expect(page).to have_content recipe.name

    visit recipe_path(recipe)
    fill_in 'Buscar Receita', with: another_recipe_search
    click_on 'Buscar'
    expect(page).to have_content another_recipe.name
  end
end
