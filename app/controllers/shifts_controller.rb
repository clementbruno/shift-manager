class ShiftsController < ApplicationController
  before_action :set_shift, only: [ :show, :edit, :update, :destroy ]

  def index
    @shifts = Shift.all
  end

  def show
    @worker = @shift.worker
  end

  def new
    @shift = Shift.new
    @workers = Worker.all
  end

  def edit
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      flash[:notice] = 'Your shift was successfully created'
      redirect_to shift_path(@shift)
    else
      render :new
    end
  end

  def update
    if @shift.update(shift_params)
      flash[:notice] = 'Your shift was successfully updated'
      redirect_to shift_path(@shift)
    else
      render :edit
    end
  end

  def destroy
    @shift.delete
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
