class JobsController < ApplicationController
  # before_filter :authenticate_user!, only: [:new, :create,:edit,:update,:destroy]


  def index
    @jobs=Job.all
  end

  def show
    @job=Job.find(params[:id])
  end








end
