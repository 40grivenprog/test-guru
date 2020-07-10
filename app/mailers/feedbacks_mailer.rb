class FeedbacksMailer < ApplicationMailer

	def feedback(params, current_user)
		subject = params[:subject]
	  @body = params[:body]

	  mail from: current_user.email, to: ENV['SMTP_USERNAME'], subject: subject
	end

end
