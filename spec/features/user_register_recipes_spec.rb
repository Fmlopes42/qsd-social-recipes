require 'rails_helper'

feature 'User register recipes' do
  scenario 'successfully' do
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    user = create(:user)
    recipe = Recipe.new(attributes_for(:recipe, cuisine: cuisine,
                                                food_type: food_type,
                                                user: user))
    # picture = "#{Rails.root}/spec/pictures/miojo.jpg"
    picture = Rails.root.join('spec', 'pictures', 'miojo.jpg')

    visit new_recipe_path

    fill_in 'Nome',                     with: recipe.name
    select food_type.name,              from: 'Tipo de comida'
    select cuisine.name,                from: 'Cozinha'
    fill_in 'Quantas pessoas serve',    with: recipe.serves
    fill_in 'Tempo de preparo',         with: recipe.prep_time
    select recipe.difficulty.humanize,  from: 'Nível de dificuldade'
    fill_in 'Ingredientes',             with: recipe.ingredients
    fill_in 'Passo a passo',            with: recipe.prep_steps
    attach_file('Foto', picture)

    click_on 'Criar Receita'

    expect(page).to have_content recipe.name
    expect(page).to have_content food_type.name
    expect(page).to have_content cuisine.name
    expect(page).to have_content recipe.serves
    expect(page).to have_content recipe.prep_time
    expect(page).to have_content recipe.difficulty.humanize
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.prep_steps

    expect(page).to have_xpath("//img[contains(@src,'miojo')]")
  end
end
