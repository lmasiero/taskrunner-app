class MainController < ApplicationController
  before_action :current_user
  before_action :current_professional

  def index
    if current_user
      redirect_to @current_user
    elsif current_professional
      redirect_to @current_professional
    end
  end
end
