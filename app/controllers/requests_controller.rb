class RequestsController < ApplicationController
  layout "request", except: [:new]
  before_action :is_authenticated
  def index
    @requests = Request.all
    @professional = @current_professional
    @user = @current_user
    # if current_user
    #   @requests = Request.where({
    #     user_id: current_user.id
    #     })
    # elsif current_pro
    #   @requests = Request.where({
    #     pro_id: current_pro.id,
    #     status: 'pending'
    #     })
    # end
  end

  # for USER only, not Pro
  def new
    @request = Request.new
    # @date = params[:date]
    @current_user = current_user
  end

  # for USER only, not Pro
  def create
    @current_user = current_user
    request_params.user_id = @current_user.id
    @request = Request.new(request_params)

    puts @request.inspect

    if @request.save
  		redirect_to requests_path, notice: 'Request has been sent to PRO_NAME! We will email you once your request is confirmed (within 1 day)'
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
  end

  # for USER only, not Pro
  def update
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
  	params.require(:request).permit(:professional_id, :appointment_time, :appointment_details, :start_time, :end_time)
  end
end
