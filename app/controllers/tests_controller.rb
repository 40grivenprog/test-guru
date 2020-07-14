# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push @test unless current_user.test_passage(@test)
    redirect_to test_passage_path(current_user.test_passage(@test))
  end
end
