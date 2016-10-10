class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_authenticated
    unless current_user || current_professional
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  private
  def current_user
  	if session[:user_id]
  		@current_user ||= User.find(session[:user_id])
  	end
  end

  def current_professional
  	if session[:user_id]
  		@current_professional ||= Professional.find(session[:user_id])
  	end
  end

  helper_method :current_user
end
