class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to feed_path if user_signed_in?
  end

  def feed
    @brands = Brand.all
  end

  def profile
  end
end
