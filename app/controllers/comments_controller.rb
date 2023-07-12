
class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_params)
    if @comment.save
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      redirect_to user_post_comment_path(@post.author_id, @post.id)
    end
  end

  private

  def post_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end
end