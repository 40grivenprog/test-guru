# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_test, only: %i[destroy edit update update_inline]
  before_action :set_tests, only: %i[index update_inline]
  def index
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.time_to_pass = time_to_pass_from_params
    @test.creator = current_user
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params) && @test.update(time_to_pass: time_to_pass_from_params)
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def time_to_pass_from_params
    time_to_pass = params.require(:test).permit(:hours, :minutes, :seconds)
    hours = time_to_pass[:hours].empty? ? "0" : time_to_pass[:hours]
    minutes = time_to_pass[:minutes].empty? ? "0" : time_to_pass[:minutes]
    seconds = time_to_pass[:seconds].empty? ? "0" : time_to_pass[:seconds]
    "#{hours}h#{minutes}m#{seconds}s"
  end

  def set_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
