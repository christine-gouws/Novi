class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def home
    redirect_to feed_path if user_signed_in?
  end

  def feed
    @brands = Brand.all
  end
end
