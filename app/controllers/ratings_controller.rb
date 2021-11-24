class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.brand_id = params[:brand_id]
    if @rating.save
      redirect_to brand_path(@rating.brand)
    else
      render "brands/show.html.erb"
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :brand_id)
  end
end
