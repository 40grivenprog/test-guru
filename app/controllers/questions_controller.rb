# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def show
    render plain: @question.inspect
  end

  def new; end

  def create
    question = Question.new(question_params)
    @test.questions.push(question)
    redirect_to test_questions_path
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'There is no such question'
  end
end
