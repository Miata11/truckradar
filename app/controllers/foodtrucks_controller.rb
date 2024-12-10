class FoodtrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    if params[:query].present?
      @foodtrucks = PgSearch.multisearch(params[:query])
    else
      @foodtrucks = Foodtruck.all
    end
  end
end
