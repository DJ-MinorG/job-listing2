class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create,:edit,:update,:destroy]


  def index
    @jobs=Job.all
  end

  def show
    @job=Job.find(params[:id])
  end


  def new
    @job=Job.new
  end

  def create

    @job=Job.new(params_job)
    if @job.save
      redirect_to jobs_path
    else
      render :new

    end
  end

  def edit
    @job=Job.find(params[:id])

  end

  def update
    @job=Job.find(params[:id])
    if @job.update(params_job)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job=Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private

  def params_job
    params.require(:job).permit(:title, :description)

  end


end
