class RecipesController < ApplicationController

  def index
    collections_all
  end

  def new
    @recipe = Recipe.new
    collections_all
  end

  def create
    collections_all
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
                                   :food_type, :cuisine_id,
                                   :serves, :prep_time,
                                   :difficulty, :ingredients,
                                   :prep_steps, :picture)
  end

  def collections_all
    @recipes = Recipe.all
    @difficulties = Recipe.difficulties
    @cuisines = Cuisine.all
  end
end
