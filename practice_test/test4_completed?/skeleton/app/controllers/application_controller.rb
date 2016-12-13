class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :require_login, :signed_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token] )
  end

  def log_out
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token
  end

  def require_login
    redirect_to new_session_url unless signed_in?
  end

  def signed_in?
    !!current_user
  end
end
