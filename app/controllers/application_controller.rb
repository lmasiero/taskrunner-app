class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_authenticated_user
    unless current_user
      flash[:danger] = "Credentials Invalid!!"
      redirect_to professional_path
    end
  end

  def is_authenticated_pro
    unless current_professional
      flash[:danger] = "Credentials Invalid!!"
      redirect_to user_path
    end
  end

  def is_authenticated
    if current_professional.blank? && current_user.blank?
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  private
  def current_user
  	if session[:user_email]
  	    @current_user ||= User.find_by(email: session[:user_email])
  	end
  end

  def current_professional
  	if session[:user_email]
  		    @current_professional ||= Professional.find_by(email: session[:user_email])
  	end
  end

  helper_method :current_user
end
