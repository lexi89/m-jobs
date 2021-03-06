class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @company = Company.find(params[:company_id])
  end

  def edit
    @company = Company.find(params[:company_id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    if @job.save
      # @job.company.followers.each do |follower|
      #   UserMailer.delay.new_job(follower.email, @job.company, @job)
      # end
      redirect_to company_path(params[:company_id])
    else
      render "new"
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    @company = Company.find(params[:company_id])
      if @job.update(job_params)
        redirect_to company_job_path(@job.company_id, @job), notice: 'Job was successfully updated.'
      else
        render "edit"
      end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :salary, :requirements, :link, :company_id, :location,
                                  :salarymin, :salarymax, :location, :jobtype, :req_ids => [], :category_ids => [])
    end
end
