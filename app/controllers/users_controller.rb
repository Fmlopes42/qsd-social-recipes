class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    collections_all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:notice] = "Bem vindo ao Social Recipes, #{@user.name}!"
    else
      flash.now[:notice] = "Não foi possível criar o usuário"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :password,
                                 :password_confirmation)
  end

  def collections_all
    @recipes = Recipe.all
    @cuisines = Cuisine.all
    @food_types = FoodType.all
  end
end
