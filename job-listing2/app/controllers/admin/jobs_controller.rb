class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create,:edit,:update,:destroy]
  before_action :require_is_admin?

  layout "admin"
  
  def require_is_admin?
    if !current_user.admin?
      flash[:alert]="You are not admin"
      redirect_to root_path
    end
  end

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
      redirect_to admin_jobs_path
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
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job=Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path
  end

  def is_hidden
    @job=Job.find(params[:id])
    @job.is_hidden!
    redirect_to :back
  end


  private

  def params_job
    params.require(:job).permit(:title, :description,:wage_upper_bound, :wage_lower_bound, :contact_email,:is_hidden)

  end


end
