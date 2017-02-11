require 'rails_helper'

feature 'User cant edit recipe from other user' do
  scenario 'successfully' do
    user = create(:user)
    user2 = create(:user, name: 'Ana', mail: 'ana@ana.com')

    food_type = create(:food_type)
    cuisine = create(:cuisine)
    recipe = create(:recipe, cuisine: cuisine, food_type: food_type, user: user)

    user_login(user2)

    visit edit_recipe_path(recipe)

    expect(page).to have_content 'Você não pode editar essa receita.'
  end
end

def user_login(user)
  visit login_path
  within 'section#login' do
    fill_in 'E-mail', with: user.mail
    fill_in 'Senha',  with: user.password
    click_on 'Entrar'
  end
end
