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
    @user = User.find(params[:id])
    collections_all
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
