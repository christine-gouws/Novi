class BrandsController < ApplicationController

  def show
    @posts = Post.all
    @brand = Brand.find(params[:id])
    following?
    p @following
    @new_post = Post.new
    @new_following = Following.new
    @rating = Rating.new
    @avg_rating = avg_rating
    @like = Like.new
  end

  def create
    brand = Brand.new()
    brand.save!
  end

  private

  def following?
    # @brand = Brand.find(params[:id])
    @following = Following.find_by(user: current_user, followable: @brand)
  end

  def avg_rating
    @ratings = Rating.where(brand: @brand)
    total = 0
    @ratings.each do |rating|
      total += rating.rating
    end
    total / @ratings.length
  end

end
