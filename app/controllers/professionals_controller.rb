class ProfessionalsController < ApplicationController
  layout "professional", except: [:new]
  before_action :is_authenticated, except: [:new, :create]
  before_action :is_authenticated_pro, except: [:new, :create, :show]
  before_action :set_professional, only: [:show, :edit, :update, :destroy]

  # GET /professionals
  # GET /professionals.json
  def index
    @professionals = Professional.all
  end

  # GET /professionals/1
  # GET /professionals/1.json
  def show
    @professional = Professional.find(params[:id])
    if current_user
      @current_user = current_user
      @requests = @professional.requests
      @services = @professional.services
      @block_times = @professional.block_times.pluck(:block_date)
    elsif current_professional
      @professional = current_professional
      @requests = @professional.requests
      @block_times = @professional.block_times.pluck(:block_date)
    end
  end

  # GET /professionals/new
  def new
    @professional = Professional.new
  end

  # GET /professionals/1/edit
  def edit
  end

  # POST /professionals
  # POST /professionals.json
  def create
    @professional = Professional.new(professional_params)

    respond_to do |format|
      if @professional.save
        format.html { redirect_to @professional, notice: 'Professional was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /professionals/1
  # PATCH/PUT /professionals/1.json
  def update
    respond_to do |format|
      if @professional.update(professional_params)
        format.html { redirect_to @professional, notice: 'Professional was successfully updated.' }
        format.json { render :show, status: :ok, location: @professional }
      else
        format.html { render :edit }
        format.json { render json: @professional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professionals/1
  # DELETE /professionals/1.json
  def destroy
    @professional.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Professional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional
      @professional = Professional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_params
      params.require(:professional).permit(:name, :email, :password, :category_id, :mobile_number, :area_ids => [])
    end
end
