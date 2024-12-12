class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites.includes(:foodtruck)

  respond_to do |format|
    format.html { render :index } # Rendu HTML si nécessaire
    format.json { render json: @favorites } # Réponse JSON pour Stimulus
    end
  end

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
    if @favorite.destroy
      render json: { url: foodtruck_favorites_path(@favorite.foodtruck) }, status: :ok
    else
      render json: { error: "Impossible de retirer des favoris" }, status: :unprocessable_entity
    end
  end


end

# if @favorite.save
#   redirect_to foodtruck_path(@foodtruck), notice: "Ajouté aux favoris !"
# else
#   redirect_to foodtruck_path(@foodtruck), alert: "Impossible d'ajouter aux favoris"
# end

# def destroy
#   @favorite = Favorite.find(params[:id])
#   @favorite.destroy
#   redirect_to foodtruck_path(@favorite.foodtruck), notice: "Retiré des favoris"
# end
