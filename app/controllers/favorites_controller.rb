class FavoritesController < ApplicationController
  def create
    collections_all
    favorite = Favorite.create(favorite_params)
    redirect_back(fallback_location: new_user_path)
  end

  def destroy
    collections_all
    favorite = Favorite.find_by user_id: params[:user_id], recipe_id: params[:recipe_id]
    favorite.destroy
    redirect_back(fallback_location: new_user_path)
  end

  private

  def favorite_params
    { user_id: params[:user_id], recipe_id: params[:recipe_id] }
  end

  def collections_all
    @recipes = Recipe.all
    @users = User.all
  end
end
