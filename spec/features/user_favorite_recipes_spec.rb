require 'rails_helper'

feature 'User can favorite recipes' do
  scenario 'succesfully' do
    user = create(:user)
    recipe = create_recipe(user)
    user_login(user)

    visit recipe_path(recipe)

    click_on 'Favoritar'
    expect(page).to have_content 'Favorita!'
  end

  scenario 'and unfavorite them' do
    user = create(:user)
    recipe = create_recipe(user)
    user_login(user)

    visit recipe_path(recipe)

    click_on 'Desfavoritar'
    expect(page).not_to have_content 'Favorita!'
  end

  scenario 'from the home page' do
    user = create(:user)
    recipe = create_recipe(user)
    user_login(user)

    visit root_path

    within 'section#recipes' do
      click_on 'Favoritar'
    end
    expect(page).to have_content 'Favorita!'
  end

  scenario 'and see them later' do
    user = create(:user)
    recipe = create_recipe(user)
    user_login(user)

    visit root_path

    within 'section#recipes' do
      click_on 'Favoritar'
    end

    visit favorites_path(user)

    expect(page).to have_content 'Minhas favoritas'
  end

  def create_recipe(user)
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    recipe = create(:recipe, food_type: food_type, cuisine: cuisine, user: user)
  end

  def user_login(user)
    visit login_path
    within 'section#login' do
      fill_in 'E-mail', with: user.mail
      fill_in 'Senha',  with: user.password
      click_on 'Entrar'
    end
  end
end
