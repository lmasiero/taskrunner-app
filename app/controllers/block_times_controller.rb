class BlockTimesController < ApplicationController
  before_action :is_authenticated
  before_action :is_authenticated_pro

  def index
    @block_times = Block_time.all
  end

  def create
    @professional = Professional.find(params[:block_time][:professional_id])
    @professional.block_times.create(block_time_params)
  end

  def new
    @professional = Professional.find(params[:professional])
    @block_time = BlockTime.new
    @selected_date = params[:date]
    @block_time.block_date = @selected_date
    @block_time_passed = BlockTime.where(:block_date=> @selected_date)
  end

  def edit
  end

  def update
  end

  def destroy
    puts "THE BLOCKTIME" + @block_time_passed.inspect
    BlockTime.find(params[:id]).delete

    redirect_to @current_professional
  end

  private
  def block_time_params
    params.require(:block_time).permit(:block_date, :professional_ids => [])
  end
end
