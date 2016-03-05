class AdminMailer < ApplicationMailer
  default from: "company_updates@example.com"

	def new_applicant(email, applicant, job)
		@company = company
		@job = job
		@email = email
		mail(to: email, subject: "New Job opening at #{@company.name}")
	end
end
