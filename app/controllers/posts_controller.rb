class PostsController < ApplicationController
  before_action :set_current_user, only: %i[new create show]

  def index
    @user = User.find_by_id(params[:user_id]) # params[:user_id] is the id of the user
    @posts = Post.where(author_id: params[:user_id])
    @comments = []
    @posts.map do |post|
      @comments = get_comments(post, 'index')
    end
  end

  def show
    @current_user = current_user
    @user = User.find_by_id(params[:user_id]) # params[:user_id] is the id of the user
    @post = Post.find_by_id(params[:id]) # params[:id] is the id of the post
    @comments = get_comments(@post, 'show')
  end

  def new
    @user = current_user # params[:user_id] is the id of the user
    @post = Post.new
  end

  def create
    # user = current_user
    @post = Post.create(post_params)
    return unless @post.save

    redirect_to user_post_path(current_user.id, @post.id)
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text)
  end

  def set_current_user
    @current_user = current_user
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