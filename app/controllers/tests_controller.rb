# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    @tests = Test.all
  end
end
