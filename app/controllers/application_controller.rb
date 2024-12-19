class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action do
    I18n.locale = :fr
  end

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :address_default, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :address_default, :photo])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
    end
end
