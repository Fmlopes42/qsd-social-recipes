require  'rails_helper'

feature  'User authenticates himself' do
  scenario 'successfully' do
    user = User.new(attributes_for(:user))
    visit root_path
    click_on 'Criar usuário'
    within 'section#user' do
      fill_in 'Nome',            with: user.name
      fill_in 'E-mail',          with: user.mail
      fill_in 'Senha',           with: user.password
      fill_in 'Confirmar senha', with: user.password_confirmation
    end
    click_on 'Criar Usuário'
    expect(page).to have_content 'Usuário criado com sucesso!'
  end

  scenario 'and can not be invalid' do
    user = User.new(attributes_for(:user, mail: '1234', password: 'abc',
                                          password_confirmation: 'abcd'))
    visit root_path
    click_on 'Criar usuário'
    within 'section#user' do
      fill_in 'Nome',            with: user.name
      fill_in 'E-mail',          with: user.mail
      fill_in 'Senha',           with: user.password
      fill_in 'Confirmar senha', with: user.password_confirmation
    end
    click_on 'Criar Usuário'
    expect(page).to have_content 'Não foi possível criar o usuário'
  end
end
