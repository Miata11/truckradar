class FavoritesController < ApplicationController

  def create
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @favorite = Favorite.new(user: current_user, foodtruck: @foodtruck)

    if @favorite.save
      render json: { url: foodtruck_favorite_path(@foodtruck, @favorite) }, status: :created
    else
      render json: { error: "Impossible d'ajouter aux favoris" }, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to foodtruck_path(@favorite.foodtruck), notice: "Retiré des favoris"
  end

end

if @favorite.save
  redirect_to foodtruck_path(@foodtruck), notice: "Ajouté aux favoris !"
else
  redirect_to foodtruck_path(@foodtruck), alert: "Impossible d'ajouter aux favoris"
end
