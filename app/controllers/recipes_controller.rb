class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    collections_all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    collections_all
    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :food_type,
                                   :food_type, :kitchen,
                                   :serves, :prep_time,
                                   :difficulty, :ingredients,
                                   :prep_steps)
  end

  def collections_all
    @difficulties = Recipe.difficulties
  end
end
