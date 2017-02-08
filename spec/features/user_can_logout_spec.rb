require 'rails_helper'

feature 'User can logout' do
  scenario 'successfully' do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    user = create(:user)
    user_login(user)
    visit root_path
    within 'section#authentication' do
      click_on "Sair"
    end
    expect(page).to have_content 'Log out com sucesso!'
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
