class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
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
end
