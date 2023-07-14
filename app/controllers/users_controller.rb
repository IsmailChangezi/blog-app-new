class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.most_recent_posts
    @posts = Post.where(author_id: @user.id)
  end
end