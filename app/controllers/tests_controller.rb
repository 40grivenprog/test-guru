# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    @user = User.second
    @user.tests.push @test
    redirect_to test_passage_path(@user.test_passage(@test))
  end
end
