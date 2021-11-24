class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to feed_path if user_signed_in?
  end

  def feed
    @brands = Brand.all
    @users = User.all
  end

  def profile
    following?
    @new_following = Following.new
  end

   private

  def following?
    # @brand = Brand.find(params[:id])
    @following = Following.find_by(user: current_user, followable: @user)
  end

end
