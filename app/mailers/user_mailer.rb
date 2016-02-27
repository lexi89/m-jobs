class UserMailer < ApplicationMailer
	default from: "updates@example.com"

	def new_job(email, company, job)
		@company = company
		@job = job
		@email = email
		mail(to: email, subject: "New Job opening at #{@company.name}")
	end
end
