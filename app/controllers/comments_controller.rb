
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

    def destroy
    @comment = Comment.find(params[:id])
    @comment.post.comments_counter -= 1
    @comment.post.save
    @comment.destroy
    redirect_to user_posts_path(@comment.user.id)
    end

  private

      def post_params
      params.require(:comment).permit(:text, :post_id, :user_id)
      end
    end