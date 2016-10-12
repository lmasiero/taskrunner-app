class RequestsController < ApplicationController
  layout "request", except: [:new]
  before_action :is_authenticated
  def index
    @user = @current_user
    @requests = @user.requests
    @professional = @current_professional
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

    if @request.save
  		redirect_to requests_path(@request), notice: 'Request has been sent to PRO_NAME! We will email you once your request is confirmed (within 1 day)'
  	else
  		render :new, notice: 'Something went wrong - please try again'
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
    puts "WE GOT TO THE EDIT PART"
  end

  # for USER only, not Pro
  def update
    puts "WE GOT TO THE UPDATE PART"
    @request = Request.find(params[:id])

    if @request.update(request_params)
      redirect_to requests_url
    else
      render "edit"
    end
  end

  # for USER only, not Pro
  def destroy
    Request.find(params[:id]).delete
    redirect_to categories_url
  end

  private

  def request_params
  	params.require(:request).permit(:professional_id, :appointment_time, :appointment_details, :start_time, :start_time_time, :end_time, @selected_date)
  end

end
