class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :require_login
  def create
    Rails.logger.info "#{request.env.inspect}"
    session[:email] = request.env['omniauth.auth'][:info][:email]
    redirect_to root_url
  end
end
