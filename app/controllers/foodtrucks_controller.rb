class FoodtrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    if params[:query].present?
      @foodtrucks = Foodtruck.search_by_foodtrucks(params[:query])
    else
      @foodtrucks = Foodtruck.all
    end

    @markers = @foodtrucks.geocoded.map do |foodtruck|
      {
        lat: foodtruck.latitude,
        lng: foodtruck.longitude,
        info_window_html: render_to_string(partial: "popupmap", locals: { foodtruck: foodtruck }),
        marker_html: render_to_string(partial: "foodtruck_marker")
      }
    end

    # Marker pour l'utilisateur
    if current_user&.latitude.present?
      @markers << {
        lat: current_user.latitude,
        lng: current_user.longitude,
        info_window_html: render_to_string(partial: "user_popup", locals: { user: current_user }),
        marker_html: render_to_string(partial: "user_marker")
      }
    end
  end

  def show
    @foodtruck = Foodtruck.find(params[:id])
  end
end
