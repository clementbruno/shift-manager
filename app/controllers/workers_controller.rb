class WorkersController < ApplicationController
  before_action :set_worker, only: [ :show, :edit, :update, :destroy ]

  def index
    @workers = Worker.all
  end

  def show
    @worker_shifts = Shift.where(worker_id: params[:id])
  end

  def new
    @worker = Worker.new
  end

  def edit
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      flash[:notice] = 'Your worker was successfully created'
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end

  def update
    if @worker.update(worker_params)
      flash[:notice] = 'Your worker was successfully updated'
      redirect_to worker_path(@worker)
    else
      render :edit
    end
  end

  def destroy
    @worker.destroy
    flash[:notice] = 'Your worker was successfully deleted'
    redirect_to workers_path
  end

  private

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def worker_params
    params.require(:worker).permit(:name, :status)
  end

end
