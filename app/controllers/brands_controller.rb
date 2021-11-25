class BrandsController < ApplicationController

  def index
    if params[:query].present?
      @brands = Brand.where("brand_name ILIKE ?", "%#{params[:query]}%")
    else
      @brands = Brand.all
    end
    respond_to do |format|
      format.html
      format.text { render partial: 'brands/list', locals: { brands: @brands }, formats: [:html] }
    end
  end

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
    total / @ratings.length if @ratings.length.positive?
  end

  def brand_params
    params.require(:brand).permit(:query)
  end

end
