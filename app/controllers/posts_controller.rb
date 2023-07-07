class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id]) # params[:user_id] is the id of the user
    @posts = Post.where(author_id: params[:user_id])
    @comments = []
    @posts.map do |post|
      @comments = get_comments(post, 'index')
    end
  end

  def show
    @user = User.find_by_id(params[:user_id]) # params[:user_id] is the id of the user
    @post = Post.find_by_id(params[:id]) # params[:id] is the id of the post
    @comments = get_comments(@post, 'show')
  end

    def get_comments(post, type)
    @comments = []
    comments = type == 'show' ? Comment.where(post_id: post.id) : post.most_recent_comments
    comments.each do |comment|
      user = User.find_by_id(comment.user_id)
      @comments << { user: user.name, comment: comment.text }
    end
    @comments
  end

end
