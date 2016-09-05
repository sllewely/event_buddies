class ApplicationController < ActionController::Base
  before_filter :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    # debugger
    # env["omniauth.auth"]
    # @current_user ||= session[:user_id]
    @current_user ||= User.find_by(first_name: 'Sarah')
  end
end
