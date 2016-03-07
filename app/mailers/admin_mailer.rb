class AdminMailer < ApplicationMailer
  default from: "company_updates@example.com"

	def new_applicant(admin, applicant, job)
    @admin = admin
    @applicant = applicant
    @job = job
		mail(to: @admin, subject: "New applicant for #{@job.title}")
	end
end
