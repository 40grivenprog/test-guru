class FeedbacksController < ApplicationController
  def new
  end

  def create
    if feedback_params[:subject].present? && feedback_params[:body].present?
      FeedbacksMailer.feedback(feedback_params, current_user).deliver_now
      redirect_to root_path
    else
      flash['alert'] = t('.feedback_error')
      render 'new'
    end
  end

  private

  def feedback_params
    params.permit(:subject, :body)
  end

end