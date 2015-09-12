class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :signed_in?


  private

  def logged_in?
    unless signed_in?
      flash[:alert] = 'Debe iniciar sesión'
      redirect_to root_path
    end
  end

  def signed_in?
    session? && current_user
  end

  def current_user

    @current_user = User.find(user_id) if session?
  end

  def session?
    session[:user_id].present?
  end

  def user_id
    session[:user_id] if session?
  end
end
