class RequestsController < ApplicationController
  layout "request", except: [:new]
  before_action :is_authenticated
  def index
    if @current_user
      @user = @current_user
      @requests = @user.requests
    elsif @current_professional
      @professional = @current_professional
      @requests = @professional.requests
    end
  end

  # for USER only, not Pro
  def new
    @request = Request.new
    @request.start_time = params[:date]
    # @date = params[:date]
    @current_user = current_user
    @selected_date = params[:date]
    puts "selected_date", @selected_date
  end

  # for USER only, not Pro
  def create
    @request = Request.new(request_params)
    @current_user = current_user
    @request[:user_id] = @current_user.id
    @request[:end_time] = request_params[:start_time]
    @request[:status] = "Pending"
    @request[:last_updated_by] = @current_user.name

    if @request.save
      flash[:success] = "Request sent. You will receive an email once request is confirmed (usually within 1 day)."
  		redirect_to requests_path(@request)
  	else
      flash[:error] = "Something went wrong. Please try again."
  		render :new
  	end
  end

  # separate actions for user and pro
  def show
    if current_user
      @request = Request.find(params[:id])
    elsif current_pro
      @request = Request.find(params[:id])
    end
  end

  # for USER only, not Pro
  # for pro to accept/reject, see main_controller (security)
  def edit
    @request = Request.find(params[:id])
  end

  # for USER only, not Pro
  def update
    @request = Request.find(params[:id])
    if params[:confirmed]
      if @current_user
        @request[:last_updated_by] = @current_user.name
      elsif @current_professional
        @request[:last_updated_by] = @current_professional.name
      end
      Request.find(params[:id]).update_attribute(:status, "Confirmed")
      flash[:success] = "Your booking is now confirmed. Smooth sailing ahead!"
      redirect_to requests_url
    else
      @request = Request.find(params[:id])
      if @current_user
        @request[:last_updated_by] = @current_user.name
      elsif @current_professional
        @request[:last_updated_by] = @current_professional.name
      end
      if @request.update(request_params)
        flash[:success] = "Request details successfully amended."
        redirect_to requests_path
      else
        render "edit"
      end
    end
  end

  # for USER only, not Pro
  def destroy
    Request.find(params[:id]).delete
    flash[:success] = "Request successfully cancelled."
    redirect_to requests_path
  end

  private
  def request_params
  	params.require(:request).permit(:professional_id, :appointment_time, :appointment_details, :start_time, :start_time_time, :end_time, @selected_date)
  end

end
