class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user = current_user
    @like.save!
    redirect_to brand_path(@like.post.messageable_id, anchor: 'thread')
  end

  def destroy
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
