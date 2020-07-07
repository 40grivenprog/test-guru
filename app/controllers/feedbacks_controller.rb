class FeedbacksController < ApplicationController
	def new
	end

	def create
		FeedbacksMailer.feedback(feedback_params, current_user).deliver_now
		redirect_to root_path
	end

	private

	def feedback_params
		params.permit(:subject, :body)
	end

end