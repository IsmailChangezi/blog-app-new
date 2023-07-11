# Purpose: Controller for likes
class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(like_params)
    @like.save
    redirect_to user_post_path(@post.author_id, @post.id)
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end