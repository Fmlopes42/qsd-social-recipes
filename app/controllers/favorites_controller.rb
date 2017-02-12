class FavoritesController < ApplicationController
  def create
    Favorite.create(favorite_params)
  end

  def delete
  end

  private

  def favorite_params
    { user_id: params[:user_id], recipe_id: params[:recipe_id] }
  end
end
