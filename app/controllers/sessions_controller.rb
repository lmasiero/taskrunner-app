class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(user_params)
    if user
      session[:user_id] = user.id
      flash[:success] = "User logged in!!"
      redirect_to user_path(user.id)
    else
        pro = Professional.authenticate(user_params)
      if pro
        session[:user_id] = pro.id
        flash[:success] = "User logged in!!"
        redirect_to professional_path(pro.id)
      else
        flash[:danger] = "Credentials Invalid!!"
        redirect_to login_path
      end
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "Logged out"
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
