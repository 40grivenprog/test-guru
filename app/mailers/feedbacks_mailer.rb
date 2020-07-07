class FeedbacksMailer < ApplicationMailer

	def feedback(params, current_user)
		subject = params[:subject]
	  @body = params[:body]

	  mail from: current_user.email, to: 'grivenprog40@gmail.com', subject: subject
	end

end
