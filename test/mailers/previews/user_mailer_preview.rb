# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def new_job
		@email = User.last.email
		@company = Company.first
		@job = Company.first.jobs.last
		UserMailer.new_job(@email, @company, @job)
	end

end
