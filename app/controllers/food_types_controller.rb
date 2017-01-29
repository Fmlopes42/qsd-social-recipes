class FoodTypesController < ApplicationController

  def new
    collections_all
    @food_type = FoodType.new
  end

  def create
    collections_all
    @food_type = FoodType.new(food_type_params)
    @food_type.save
    redirect_to @food_type
  end

  def show
    collections_all
    @food_type = FoodType.find params[:id]
  end

  private

  def food_type_params
    params.require(:food_type).permit(:name)
  end

  def collections_all
    @food_types = FoodType.all
  end

end
