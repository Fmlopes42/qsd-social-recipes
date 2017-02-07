require 'rails_helper'

feature 'User delete recipe' do
  scenario 'successfully' do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    user = create(:user)
    recipe = create(:recipe, food_type: food_type, cuisine: cuisine, user: user)

    visit login_path

    within 'section#login' do
      fill_in 'E-mail',          with: user.mail
      fill_in 'Senha',           with: user.password
      click_on 'Entrar'
    end

    visit recipe_path(recipe)
    click_on 'Excluir'

    expect(page).to have_content 'Receita excluida com sucesso!'
  end
end
