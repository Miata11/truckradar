class FoodtrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:query].present?
      @foodtrucks = Foodtruck.search_by_foodtrucks(params[:query])
    else
      @foodtrucks = Foodtruck.all
    end

    # Markers pour les foodtrucks
    @markers = @foodtrucks.geocoded.map do |foodtruck|
      {
        lat: foodtruck.latitude,
        lng: foodtruck.longitude,
        info_window_html: render_to_string(partial: "popupmap", locals: { foodtruck: foodtruck }),
        marker_html: render_to_string(partial: "foodtruck_marker", locals: {
          connected: foodtruck.user.role == "true" && foodtruck.real_time_tracking,
          foodtruck: foodtruck
        })
      }
    end

    # Marker pour l'utilisateur connecté à son address_default
    if current_user&.latitude.present? && !current_user.real_time_tracking
      @markers << {
        lat: current_user.latitude,
        lng: current_user.longitude,
        info_window_html: render_to_string(partial: "user_popup", locals: { user: current_user }),
        marker_html: render_to_string(partial: "user_marker", locals: { user: current_user })
      }
    end
  end

  def update_location
    @foodtruck = Foodtruck.find(params[:id])
    if @foodtruck.update(latitude: params[:latitude], longitude: params[:longitude])
      render json: { success: true }
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  def show
    @foodtruck = Foodtruck.find(params[:id])
  end

  def new
    @foodtruck = Foodtruck.new
  end

  def create
    @foodtruck = Foodtruck.new(foodtruck_params)
    @foodtruck.user = current_user
    if @foodtruck.save
      redirect_to foodtrucks_path, notice: "Votre FoodTruck a été créé avec succès"
    else
      render :new, alert: "Erreur lors de la création"
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

  def foodtruck_params
    params.require(:foodtruck).permit(:name, :company_name, :category, :description, :address_default, :phone_number, :photo)
  end
end
