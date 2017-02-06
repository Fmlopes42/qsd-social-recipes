class RecipesController < ApplicationController
  def index
    @recipes = Recipe.last(5)
    @difficulties = Recipe.difficulties
    @cuisines = Cuisine.all
    @food_types = FoodType.all
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

  def search
    search = params[:search]
    @recipes = Recipe.all.select do |recipe|
      recipe.name.downcase.include?(search.downcase)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :food_type,
                                   :food_type_id, :cuisine_id,
                                   :serves, :prep_time,
                                   :difficulty, :ingredients,
                                   :prep_steps, :picture)
  end

  def collections_all
    @recipes = Recipe.all
    @difficulties = Recipe.difficulties
    @cuisines = Cuisine.all
    @food_types = FoodType.all
  end
end
