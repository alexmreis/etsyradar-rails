class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

  def require_login
    redirect_to '/auth/developer' unless session[:email]
  end

  def current_user
    @user ||= User.find_or_create_by(:email => session[:email])
  end
end
