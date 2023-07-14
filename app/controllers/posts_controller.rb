class PostsController < ApplicationController
  before_action :set_current_user, only: %i[new create show]
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_user

  def index
    @user = User.find_by_id(params[:user_id]) # params[:user_id] is the id of the user
    @posts = Post.where(author_id: params[:user_id]).includes(:most_recent_comments)
  end

  def show
    @current_user = current_user
    @post = Post.find_by_id(params[:id])
  end

  def new
    @user = current_user # params[:user_id] is the id of the user
    @post = Post.new
  end

  def create
    # user = current_user
    @post = Post.new(post_params)
    return unless @post.save

    redirect_to user_post_path(current_user.id, @post.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    @user.posts_counter -= 1
    @user.save
    redirect_to user_posts_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text)
  end

  def set_current_user
    @current_user = current_user
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end