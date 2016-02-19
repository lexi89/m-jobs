class IndustriesController < ApplicationController
	def show
		@industry = Industry.find(params[:id])
		@companies = @industry.companies
	end

end
