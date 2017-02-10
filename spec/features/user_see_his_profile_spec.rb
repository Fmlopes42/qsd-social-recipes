require 'rails_helper'

feature 'User see his profile' do
  scenario 'with one recipe successfully' do
    user = create(:user, city: 'São Paulo')
    food_type = create(:food_type)
    cuisine = create(:cuisine)
    recipe = create(:recipe, cuisine: cuisine, food_type: food_type, user: user)

    visit user_path(user)

    within('section#recipes') do
      expect(page).to have_content recipe.name
      expect(page).to have_content recipe.food_type
      expect(page).to have_content recipe.cuisine
    end

    whitin('section#user') do
      expect(page).to have_content user.name
      expect(page).to have_content user.city
      expect(page).to have_content user.mail
    end
  end
end
