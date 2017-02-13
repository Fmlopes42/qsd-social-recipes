require 'rails_helper'

describe Recipe do
  describe '.favorite_by?' do
    it do
      recipe = create(:recipe)
      user = create(:user, mail: 'new@user.com')
      recipe.favorites.create(user: user)
      expect(recipe).to be_favorite_by user
    end

    it do
      recipe = create(:recipe)
      user = create(:user, mail: 'new@user.com')
      expect(recipe).to_not be_favorite_by user

    end
  end
end
