require 'rails_helper'

feature 'visitor cant favorite recipes' do
  scenario 'succesfully' do
    user = create(:user)
    recipe = create_recipe(user)

    visit recipe_path(recipe)

    expect(page).not_to have_button 'Favoritar'
  end

  scenario 'or see it was favorited and unfavorite' do
    user = create(:user)
    user2 = create(:user, name: 'Ana', mail: 'ana@ana.com')
    recipe = create_recipe(user2)
    user_login(user)

    visit recipe_path(recipe)

    click_on 'Favoritar'

    click_on 'Sair'

    visit root_path

    expect(page).not_to have_content 'Favorita!'
    expect(page).not_to have_button 'Desfavoritar'
  end

  scenario 'from initial page' do
    user = create(:user)
    recipe = create_recipe(user)

    visit root_path

    expect(page).not_to have_button 'Favoritar'
  end

  def create_recipe(user)
    food_type = create(:food_type, name: "Jantar")
    cuisine = create(:cuisine, name: "Romana")
    recipe = create(:recipe, name: "Rigatoni", food_type: food_type,
                             cuisine: cuisine, user: user)
  end
end
