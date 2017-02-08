class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

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
    @recipe.user = current_user
    if @recipe.save
      redirect_to @recipe
      flash[:notice] = 'Receita criada com sucesso!'
    else
      flash.now[:notice] = 'Sua receita nao pode ser criada.'
      render :new
    end
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

  def edit
    @recipe = Recipe.find params[:id]
    collections_all
  end

  def update
    collections_all
    @recipe = Recipe.find params[:id]
    if @recipe.update recipe_params
      redirect_to @recipe
      flash[:notice] = 'Receita editada com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível editar a receita.'
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find params[:id]
    recipe.destroy
    redirect_to root_url
    flash[:notice] = 'Receita excluida com sucesso!'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :food_type_id, :cuisine_id,
                                   :serves, :prep_time, :difficulty,
                                   :ingredients, :prep_steps, :picture,
                                   :user_id)
  end

  def collections_all
    @recipes = Recipe.all
    @difficulties = Recipe.difficulties
    @cuisines = Cuisine.all
    @food_types = FoodType.all
    @users = User.all
  end
end
