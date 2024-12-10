class FoodtrucksController < ApplicationController

  def index
    @foodtrucks = Foodtruck.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @foodtrucks.geocoded.map do |foodtruck|
      {
        lat: foodtruck.latitude,
        lng: foodtruck.longitude,
        info_window_html: render_to_string(partial:"popupmap", locals: {foodtruck: foodtruck})
      }
    end
  end

end
