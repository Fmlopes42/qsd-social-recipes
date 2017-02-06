require 'rails_helper'

feature 'Admin register food type' do
  scenario 'successfully' do
    food_type = FoodType.new(attributes_for(:food_type))

    visit new_food_type_path

    fill_in 'Nome', with: food_type.name

    click_on 'Criar Tipo de Comida'

    expect(page).to have_content food_type.name
  end
end
