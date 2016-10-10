class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def is_authenticated
    unless current_professional || current_user
      flash[:danger] = "Credentials Invalid!!"
      redirect_to login_path
    end
  end

  private
  def current_user
  	if session[:user_id]
      userExists = User.where(id: session[:user_id])
      if userExists.present?
  		    @current_user ||= User.find(session[:user_id])
      end
  	end
  end

  def current_professional
  	if session[:user_id]
      professionalExists = Professional.where(id: session[:user_id])
      if professionalExists.present?
  		    @current_professional ||= Professional.find(session[:user_id])
      end
  	end
  end

  helper_method :current_user
end
