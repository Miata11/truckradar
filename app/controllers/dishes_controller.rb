class DishesController < ApplicationController
  before_action :set_foodtruck, only: [:new, :create]

  def index
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @dishes = @foodtruck.dishes
  end

  def new
    @dish = @foodtruck.dishes.new
  end

  def create
    @dish = @foodtruck.dishes.new(dish_params)
    if @dish.save
      redirect_to foodtruck_path(@foodtruck), notice: "Le plat a été ajouté avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end



  def destroy
    dish = Dish.find(params[:id])
    if dish.delete
      redirect_to foodtruck_path(dish.foodtruck), notice: "Le plat a été supprimé avec succès."
    else
      render foodtruck_path(dish.foodtruck), status: :unprocessable_entity
    end
  end

  private

  def set_foodtruck
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
  end

  def dish_params
    params.require(:dish).permit(:title, :description, :price, :photo)
  end

end
