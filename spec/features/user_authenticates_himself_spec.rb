require  'rails_helper'

feature  'User authenticates himself' do
  scenario 'successfully' do
    user = User.new(attributes_for(:user))

    visit root_path

    click_on "Criar usuário"
    within "section#user" do
      fill_in "Nome",            with: user.name
      fill_in "E-mail",          with: user.mail
      fill_in "Senha",           with: user.password
      fill_in "Confirmar senha", with: user.password_confirmation
    end

    click_on "Criar Usuário"

    expect(page).to have_content "Bem vindo ao Social Recipes, #{user.name}"
  end

  scenario 'and can log in' do

    user = create(:user)

    visit root_path

    click_on "Entrar"

    within 'section#login' do
      fill_in "E-mail",          with: user.mail
      fill_in "Senha",           with: user.password

      click_on "Entrar"
    end

    expect(page).to have_content "Bem-vindo, #{@user}!"

  end

end
