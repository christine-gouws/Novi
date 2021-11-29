class FollowingsController < ApplicationController
  def create
    @following = Following.new(following_params)
    @following.user = current_user
    @following.save!
    if @following.followable_type == "Brand"
      redirect_to brand_path(@following.followable_id)
    else
      redirect_to user_path(@following.followable_id)
    end
  end

  def destroy
    following = Following.find(params[:id])
    following.destroy
    if following.followable_type == "Brand"
      redirect_to brand_path(following.followable_id)
    else
      redirect_to user_path(following.followable_id)
    end
  end

  private

  def following_params
    params.require(:following).permit(:followable_type, :followable_id)
  end
end
