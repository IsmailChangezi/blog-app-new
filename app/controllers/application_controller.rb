class Api::V1::ApplicationController < ActionController::Base
  respond_to :json
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :update_allowed_arameters, if: :devise_controller?

  protected

  def update_allowed_arameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def sign_out_current_user
    cookies.delete(:_session_id)
  end
end