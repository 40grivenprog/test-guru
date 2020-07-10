# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail from: current_user.email, to: '', subject: 'Test Completed'
  end
end
