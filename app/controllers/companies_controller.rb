class CompaniesController < ApplicationController
  autocomplete :company, :name
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def import
    @company = Company.new
    begin
      Company.import(params[:file])
      redirect_to companies_path, notice: "Companies successfully imported"
    rescue
      redirect_to companies_path, notice: "Invalid CSV"
    end
  end

  def index
    @search = Company.search do
      fulltext params[:search]
    end
    @companies = @search.results
  end

  def claim
    @company = Company.find(params[:company_id])
    @user = current_user
    @user.claim(@company)
    redirect_to @company
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:mission, :description, :name, :logo, :location, :url, :employees, :making, :industry_ids => [])
    end
end
