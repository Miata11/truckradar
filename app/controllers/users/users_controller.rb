class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :update_location
  respond_to :json, only: :update_location

  def update_location
    if current_user&.update(
      latitude: params[:latitude],
      longitude: params[:longitude]
    )
      render json: { success: true }, status: :ok
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end
end
