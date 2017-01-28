require 'rails_helper'

feature 'User register recipes' do
  scenario 'successfully' do
    recipe = Recipe.new(attributes_for(:recipe))

    visit new_recipe_path

    fill_in 'Nome',                     with: recipe.name
    fill_in 'Tipo de comida',           with: recipe.food_type
    fill_in 'Cozinha',                  with: recipe.kitchen
    fill_in 'Quantas pessoas serve',    with: recipe.serves
    fill_in 'Tempo de preparo',         with: recipe.prep_time
    select  recipe.difficulty.humanize, from: 'Nível de dificuldade'
    fill_in 'Ingredientes',             with: recipe.ingredients
    fill_in 'Passo a passo',            with: recipe.prep_steps

    click_on "Criar Receita"

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.food_type
    expect(page).to have_content recipe.kitchen
    expect(page).to have_content recipe.serves
    expect(page).to have_content recipe.prep_time
    expect(page).to have_content recipe.difficulty.humanize
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.prep_steps
  end
end
