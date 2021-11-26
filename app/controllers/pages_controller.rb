class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to feed_path if user_signed_in?
  end

  def feed
    @brands = Brand.all
    @users = User.all
    @top12 = Following.where(user: current_user, followable_type: "Brand")
    count = Brand.count
    random_offset = rand(count)
    @brand = Brand.offset(random_offset).first
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
