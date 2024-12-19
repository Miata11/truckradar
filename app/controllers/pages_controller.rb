class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :faq]

  def dashboard
    @favorites = current_user.favorites.includes(:foodtruck)
  end

  def faq
  end

  def home
  end
end
