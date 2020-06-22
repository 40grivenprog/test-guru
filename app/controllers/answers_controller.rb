# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show]
  before_action :authenticate_user!

  def show; end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
