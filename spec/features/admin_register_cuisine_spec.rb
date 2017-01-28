require 'rails_helper'

feature 'User register recipe by cuisine' do
  scenario 'successfully' do
    
    cuisine = Cuisine.new(attributes_for(:cuisine))

    visit new_cuisine_path

    fill_in 'Nome',  with: cuisine.name

    click_on "Criar Cozinha"

    expect(page).to have_content cuisine.name

  end
end
