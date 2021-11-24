class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save!
    redirect_to brand_path(params[:brand_id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to brand_path(params[:brand_id])
  end

  private

  def post_params
    params.require(:post).permit(:comment, :messageable_id, :messageable_type)
  end
end
