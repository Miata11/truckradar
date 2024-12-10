class FoodtrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    if params[:query].present?
      @foodtrucks = PgSearch.multisearch(params[:query])
      # The `geocoded` scope filters only flats with coordinates
      @markers = @foodtrucks.geocoded.map do |foodtruck|
      {
        lat: foodtruck.latitude,
        lng: foodtruck.longitude,
        info_window_html: render_to_string(partial:"popupmap", locals: {foodtruck: foodtruck})
      }
      else
      @markers = @foodtrucks.all.geocoded.map do |foodtruck|
      {
        lat: foodtruck.latitude,
        lng: foodtruck.longitude,
        info_window_html: render_to_string(partial:"popupmap", locals: {foodtruck: foodtruck})
      }
    end
  end
end
