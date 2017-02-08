require 'rails_helper'

feature 'User cant create invalid recipe' do
  scenario 'successfully' do
    user = create(:user)
    user_login(user)
    visit new_recipe_path
    click_on 'Criar Receita'
    expect(page).to have_content 'Sua receita nao pode ser criada.'
  end

  scenario 'and cant save an edited recipe if invalid' do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    user = create(:user)
    recipe = create(:recipe, food_type: food_type, cuisine: cuisine, user: user)
    user_login(user)
    visit recipe_path(recipe)
    click_on 'Editar'

    fill_in 'Quantas pessoas serve',    with: 'abc'
    fill_in 'Tempo de preparo',         with: 'abc'
    fill_in 'Ingredientes',             with: ''
    fill_in 'Passo a passo',            with: ''
    click_on 'Editar Receita'

    expect(page).to have_content 'Não foi possível editar a receita.'
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
