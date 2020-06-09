# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    @user = User.find(session[:user_id])
    @user.tests.push @test
    redirect_to test_passage_path(@user.test_passage(@test))
  end
end
