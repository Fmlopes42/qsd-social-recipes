class CuisinesController < ApplicationController

  def new
    @cuisine = Cuisine.new
    collections_all
  end

  def create
    @cuisine = Cuisine.new cuisine_params
    @cuisine.save
    collections_all
    redirect_to @cuisine
  end

  def show
    @cuisine = Cuisine.find params[:id]
    collections_all
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end

  def collections_all
    @cuisines = Cuisine.all
  end

end
