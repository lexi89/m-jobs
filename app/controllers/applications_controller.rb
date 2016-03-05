class ApplicationsController < ApplicationController

  def index

  end

  def create
    @job = Job.find(params[:job_id])
    current_user.apply(@job)
    respond_to do |format|
      format.html {redirect_to @job}
      format.js
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    current_user.unapply(@job)
    respond_to do |format|
      format.html {redirect_to @job}
      format.js
    end

  end
end
