class ShiftsController < ApplicationController
  before_action :set_shift, only: [ :edit, :update, :destroy ]

  def index
    @shifts = Shift.all
  end

  def new
    @shift = Shift.new
    @workers = Worker.all
  end

  def create
    @shift = Shift.new(shift_params)
    @worker = @shift.worker
    if @shift.save
      flash[:notice] = 'Your shift was successfully created'
      redirect_to worker_path(@worker)
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
      redirect_to worker_path(@worker)
    else
      render :edit
    end
  end

  def destroy
    @worker = @shift.worker
    @shift.delete
    redirect_to worker_path(@worker)
  end

  private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:date, :worker_id)
  end

end
