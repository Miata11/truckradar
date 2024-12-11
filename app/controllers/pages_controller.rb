class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def dashboard
    @favorites = current_user.favorites.includes(:foodtruck)
  end
end
