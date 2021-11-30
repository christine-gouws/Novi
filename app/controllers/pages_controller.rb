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
    @qoutes = [
      '“Demand quality, not just in the products you buy, but in the life of the person who made it.” – Orsola de Castro',
      '“Buy less. Choose Well. Make it Last.” – Vivienne Westwood',
      '“Fast fashion isn’t free. Someone, somewhere, is paying.” – Lucy Siegle',
      '“Care for your clothes like the good friends they are” – Joan Crawford',
      '“Trust no multinational brand. Listen to garment workers instead.” – Aja Barber',
      '“Waste isn’t waste until we waste it.” – WILL.I.AM',
      "“No, no, I didn’t go to England, I went to London.” - Paris Hilton",
      "“cake it until you make it” - tronches2cakes on instagram",
      "“I thought Europe was a country”. - Kellie Pickler",
      "“hug a tree they have less problems than people” - Tina "
    ]
    @qoute = @qoutes.sample
  end

  def dashboard
    following?
    @new_following = Following.new
  end

  def about
  end

  def registration
  end

  def thankyou
  end

  private

  def following?
    # @brand = Brand.find(params[:id])
    @following = Following.find_by(user: current_user, followable: @user)
  end

end
