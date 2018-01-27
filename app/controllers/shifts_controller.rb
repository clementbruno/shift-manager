class ShiftsController < ApplicationController
  before_action :set_shift, only: [ :edit, :update, :destroy ]

  def index
    @shifts = Shift.all
  end

  def new
    # @worker = Worker.find(params[:worker_id])
    @shift = Shift.new
    @workers = Worker.all
  end

  def create
    @workers = Worker.all
    @shift = Shift.new(shift_params)
    @worker = @shift.worker
    if @shift.save
      flash[:notice] = 'Your shift was successfully created'
      redirect_to shifts_path
    else
      render :new
    end
  end

  def edit
    @worker = @shift.worker
    @workers = Worker.all
  end

  def update
    @worker = @shift.worker
    if @shift.update(shift_params)
      flash[:notice] = 'Your shift was successfully updated'
      redirect_to shifts_path
    else
      render :edit
    end
  end

  def destroy
    @worker = @shift.worker
    @shift.destroy
    redirect_to shifts_path
  end

  private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:date, :worker_id)
  end

end
