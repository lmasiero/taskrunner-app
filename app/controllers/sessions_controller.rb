class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(user_params)
    if user
      session[:user_email] = user.email
      flash[:success] = "Successfully logged in."
      redirect_to user_path(user.id)
    else
        pro = Professional.authenticate(user_params)
      if pro
        session[:user_email] = pro.email
        flash[:success] = "Successfully logged in."
        redirect_to professional_path(pro.id)
      else
        flash[:danger] = "The credentials you've entered are invalid."
        redirect_to login_path
      end
    end
  end

  def destroy
  	session[:user_email] = nil
  	redirect_to root_url
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
