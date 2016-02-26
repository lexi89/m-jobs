class InterestsController < ApplicationController

	def index
		@companies = Company.find(current_user.following_ids)
	end

	def create
		@company = Company.find(params[:followed_id])
		current_user.follow(@company)
		respond_to do |format|
			format.html { redirect_to current_user }
			format.js
		end
	end

	def destroy
		@company = Company.find(params[:followed_id])
		current_user.unfollow(@company)
		respond_to do |format|
			format.html { redirect_to current_user }
			format.js
		end
	end

end
