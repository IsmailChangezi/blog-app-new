class Api::CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
      user = User.find(params[:author_id])
      post = user.posts.find(params[:id])
      comments = post.comments
  
      render json: comments
    end
  
    def create
      post = Post.find(params[:post_id])
      comment = post.comments.build(comment_params)
      comment.user = current_user
  
      if comment.save
        render json: comment, status: :created
      else
        render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end