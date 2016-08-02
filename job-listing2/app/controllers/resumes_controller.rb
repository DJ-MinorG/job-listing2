class ResumesController < ApplicationController
  def new
    @job=Job.find(params[:job_id])
    @resume=Resume.new

  end

  def create
    @resume=Resume.new(params_resume)
    @job=Job.find(params[:job_id])
    @resume.user=current_user
    @resume.job=@job
    if @resume.save
      flash[:notice]= "成功提交履歷"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  private
  def params_resume
    params.require(:resume).permit(:content, :attachment)
  end
end
