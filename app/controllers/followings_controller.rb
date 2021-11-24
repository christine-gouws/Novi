class FollowingsController < ApplicationController
  def create
    @following = Following.new(following_params)
    @following.user = current_user
    @following.save!
    redirect_to brand_path(@following.followable_id)
  end

  def destroy
    following = Following.find(params[:id])
    following.destroy
    redirect_to brand_path(following.followable_id)
  end

  private

  def following_params
    params.require(:following).permit(:followable_type, :followable_id)
  end
end
