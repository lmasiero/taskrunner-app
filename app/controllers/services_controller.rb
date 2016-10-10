class ServicesController < ApplicationController
  layout "service"
  before_action :is_authenticated_pro

  def index
    @professional = Professional.find(params[:professional_id])
    @service = Service.new
    # @service = @professional.services.create(service_params)
    @services = @professional.services
  end

  def create
    @professional = Professional.find(params[:professional_id])
    @service = @professional.services.create(service_params)
    data = @professional
  end

  def new
    @professional = Professional.find(params[:professional_id])
    @service = Service.new
  end

  def edit
  end

  def show
  end

  def destroy
    @professional = Professional.find(params[:professional_id])
    @service = @professional.services.find(params[:id])
    @service.destroy
  end

  private
  def service_params
    params.require(:service).permit(:name)
  end
end
