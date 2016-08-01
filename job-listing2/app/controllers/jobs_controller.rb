class JobsController < ApplicationController
  # before_filter :authenticate_user!, only: [:new, :create,:edit,:update,:destroy]


  def index
    @jobs=Job.where(:is_hidden => false).order(:created_at => "DESC")
  end

  def show
    @job=Job.find(params[:id])
    if @job.is_hidden
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
    end
  end








end
