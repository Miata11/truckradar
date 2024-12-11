class FoodtrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index update_guest_location]

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

    # Ajout du marker pour l'utilisateur connecté ou invité
    if user_signed_in? && current_user.latitude.present?
      @markers << user_marker(current_user)
    elsif session[:guest_latitude].present?
      @markers << guest_marker
    end
  end

  def update_guest_location
    session[:guest_latitude] = params[:latitude]
    session[:guest_longitude] = params[:longitude]
    render json: { success: true }
  end

  def update_location
    @foodtruck = Foodtruck.find(params[:id])
    if @foodtruck.update(latitude: params[:latitude], longitude: params[:longitude])
      render json: { success: true }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  private

  def user_marker(user)
    {
      lat: user.latitude,
      lng: user.longitude,
      info_window_html: render_to_string(partial: "user_popup", locals: { user: user }),
      marker_html: render_to_string(partial: "user_marker")
    }
  end

  def guest_marker
    {
      lat: session[:guest_latitude],
      lng: session[:guest_longitude],
      info_window_html: render_to_string(partial: "guest_popup"),
      marker_html: render_to_string(partial: "guest_marker")
    }
  end
end
