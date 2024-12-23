class FoodtrucksController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[index show]

  before_action :set_foodtruck, only: [:available_status, :unavailable_status]

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
        }),
        is_current_user: foodtruck.user == current_user
      }
    end

    # Marker pour l'utilisateur connecté à son address_default
    if current_user&.latitude.present? && !current_user.real_time_tracking
      @markers << {
        lat: current_user.latitude,
        lng: current_user.longitude,
        info_window_html: render_to_string(partial: "user_popup", locals: { user: current_user }),
        marker_html: render_to_string(partial: "user_marker", locals: { user: current_user }),
        # is_current_user: current_user.present? == true
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
    @dishes = @foodtruck.dishes
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
      Rails.logger.info "FOODTRUCK ERRORS: #{@foodtruck.errors.full_messages}"
      render :new, alert: "Erreur lors de la création"
    end
  end

  def edit
    @foodtruck = Foodtruck.find(params[:id])
    @foodtruck.dishes.build if @foodtruck.dishes.empty?
  end

  def update
    @foodtruck = Foodtruck.find(params[:id])
    # je recupère dans les params toutes les données des dishes
    dishes = params[:foodtruck][:dishes_attributes]
    # j'itère sur mes données dishes
    # dishes.each do |index, dishes_attributes|
    #   # je vais cherche le dish qui doit etre update
    #   dish = Dish.find(dishes_attributes[:id])
    #   # je mets à jour le dish
    #   dish.update(dishes_attributes.permit(:title, :price, :description, :photo))
    # end
    if @foodtruck.update(foodtruck_params)
      redirect_to @foodtruck, notice: 'Le foodtruck a été mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

   # methodes pour bouton activer ou desactiver ma présence
   def available_status
    @foodtruck = current_user.foodtruck
    @foodtruck.update(status: true)
    redirect_to dashboard_path(anchor: 'foodtruck'), notice: "Votre présence est activée."
  end

  def unavailable_status
    @foodtruck = current_user.foodtruck
    @foodtruck.update(status: false)
    redirect_to dashboard_path(anchor: 'foodtruck'), notice: "Votre présence est désactivée."
  end

  private

  # def user_marker(user)
  #   {
  #     lat: user.latitude,
  #     lng: user.longitude,
  #     info_window_html: render_to_string(partial: "user_popup", locals: { user: user }),
  #     marker_html: render_to_string(partial: "user_marker"),
  #   }
  # end

  def foodtruck_params
    params.require(:foodtruck).permit(:name, :company_name, :description, :address_default, :phone_number, :photo, categories: [])
  end

  def set_foodtruck
    @foodtruck = current_user.foodtruck
  end
end
