# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_test, only: %i[start]
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    @user.tests.push @test
    redirect_to test_passage_path(@user.test_passage(@test))
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.second
  end
end
