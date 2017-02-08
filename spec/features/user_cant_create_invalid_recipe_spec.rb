require 'rails_helper'

feature 'User cant create invalid recipe' do
  scenario 'successfully' do
    user = create(:user)
    user_login(user)
    visit new_recipe_path
    click_on 'Criar Receita'
    expect(page).to have_content 'Sua receita nao pode ser criada.'
  end
end
