require 'rails_helper'

feature 'user can log in' do
  scenario 'successfully' do
    user = create(:user)
    visit root_path
    within 'section#authentication' do
      click_on 'Entrar'
    end
    within 'section#login' do
      fill_in 'E-mail',          with: user.mail
      fill_in 'Senha',           with: user.password
      click_on 'Entrar'
    end
    expect(page).to have_content "Bem-vindo(a) de volta, #{user.name}!"
  end
end
