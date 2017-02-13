class UsersController < ApplicationController
  def new
    @user = User.new
    collections_all
  end

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      redirect_to login_path
      flash[:notice] = 'Usuário criado com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível criar o usuário'
      render :new
    end
  end

  def show
    collections_all
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :city, :password,
                                 :password_confirmation)
  end

  def collections_all
    @recipes = Recipe.all
    @cuisines = Cuisine.all
    @food_types = FoodType.all
    @favorite = Favorite.all
  end
end
