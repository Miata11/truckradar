class FoodtrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    if params[:query].present?
      # @foodtrucks = PgSearch.multisearch(params[:query])
      @foodtrucks = Foodtruck.search_by_foodtrucks(params[:query])
      # The `geocoded` scope filters only flats with coordinates
      @markers = @foodtrucks.geocoded.map do |foodtruck|
      {
        lat: foodtruck.latitude,
        lng: foodtruck.longitude,
        info_window_html: render_to_string(partial:"popupmap", locals: {foodtruck: foodtruck})
      }
      end
    else
      @markers = Foodtruck.all.geocoded.map do |foodtruck|
      {
        lat: foodtruck.latitude,
        lng: foodtruck.longitude,
        info_window_html: render_to_string(partial:"popupmap", locals: {foodtruck: foodtruck})
      }
      end
    end
  end

  def show
    @foodtruck = Foodtruck.find(params[:id])
  end

end
