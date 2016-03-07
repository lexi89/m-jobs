class ApplicationsController < ApplicationController

  def index

  end

  def create
    @job = Job.find(params[:job_id])
    current_user.apply(@job)
    @job.company.users.each do |admin|
      AdminMailer.delay.new_applicant(admin, current_user, @job)
    end
    respond_to do |format|
      format.html {redirect_to @job, notice: "Application received"}
      format.js
    end

  end

  def destroy
    @job = Job.find(params[:job_id])
    current_user.unapply(@job)
    respond_to do |format|
      format.html {redirect_to @job, notice: "Application removed"}
      format.js
    end

  end
end
