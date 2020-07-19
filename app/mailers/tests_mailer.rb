# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @statistic = test_passage.calculate_statistic
    mail from: @user.email, to: ENV['SMTP_USERNAME'], subject: "#{@user.email} completed test"
  end
end
