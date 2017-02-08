require 'rails_helper'

feature 'User edit recipe' do
  scenario 'successfully' do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    user = create(:user)
    recipe = create(:recipe, food_type: food_type, cuisine: cuisine, user: user)

    recipe2 = Recipe.new(attributes_for(:recipe, serves: 9, prep_time: 23,
                                                 ingredients: 'Outros',
                                                 prep_steps: 'Passos2'))

    user_login(user)

    visit recipe_path(recipe)
    click_on 'Editar'

    fill_in 'Quantas pessoas serve',    with: recipe2.serves
    fill_in 'Tempo de preparo',         with: recipe2.prep_time
    fill_in 'Ingredientes',             with: recipe2.ingredients
    fill_in 'Passo a passo',            with: recipe2.prep_steps

    click_on 'Editar Receita'

    expect(page).to have_content recipe.name
    expect(page).to have_content food_type.name
    expect(page).to have_content cuisine.name
    expect(page).to have_content recipe2.serves
    expect(page).to have_content recipe2.prep_time
    expect(page).to have_content recipe.difficulty.humanize
    expect(page).to have_content recipe2.ingredients
    expect(page).to have_content recipe2.prep_steps
  end

  scenario 'and cant save if invalid' do
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
