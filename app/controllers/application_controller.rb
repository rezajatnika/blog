class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  # Method for declare current_user that logged in
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    user == current_user
  end

  # Authorize for current_user
  def authorize
    redirect_to login_path, alert: "Not authorized!" if current_user.nil?
  end

  # Transform current_user into helper method
  helper_method :current_user, :current_user?
end
