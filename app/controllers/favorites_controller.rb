class FavoritesController < ApplicationController
  def create
    favorite = Favorite.create(favorite_params)
    redirect_back(fallback_location: new_user_path)
  end

  def destroy
    favorite = Favorite.find_by user_id: params[:user_id], recipe_id: params[:recipe_id]
    favorite.delete
    redirect_back(fallback_location: new_user_path)
  end

  private

  def favorite_params
    { user_id: params[:user_id], recipe_id: params[:recipe_id] }
  end
end
