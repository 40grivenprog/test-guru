# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show create result update restart gist]
  before_action :authenticate_user!

  def show
    if @test_passage.complete?
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.complete?
      # TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage).call

    flash_options = if result.nil?
                      flash[:alert] = t('.not_created')
                    else
                      flash[:success] = t('.created', url: result.git_push_url)
                    end

    redirect_to test_passage_path @test_passage
  end

  def restart
    @test_passage.restart
    redirect_to test_passage_path @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
