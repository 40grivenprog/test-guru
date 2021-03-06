# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show create result update restart gist]
  before_action :authenticate_user!
  before_action :check_time, only: %i[update]

  def show
    if @test_passage.complete?
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.complete?
      @test_passage.check_results
      badge_service = BadgeReceiveService.new(@test_passage)
      badge_service.call
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    client = GistQuestionService.new(@test_passage.current_question)
    client.call

    flash_options = if client.success?
                      current_user.gists.create(gist_url: client.gist_url, question_id: @test_passage.current_question.id)
                      flash[:success] = t('.created', url: client.gist_url)
                    else
                      flash[:alert] = t('.not_created')
                    end

    redirect_to test_passage_path @test_passage
  end

  private

  def check_time
    if Time.at(@test_passage.time_started).utc + @test_passage.test.time_to_pass * 60 < Time.now.utc
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def send_result
    TestsMailer.completed_test(@test_passage).deliver_now
  end
end
