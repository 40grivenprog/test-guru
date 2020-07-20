# frozen_string_literal: true

class BadgeReceiveService
  def initialize(test_passage)
    @test_passage = test_passage
    set_variables
  end

  def call
    Badge.all.each do |badge|
      if send("#{badge.badge_type}_condition", badge.value) && not_has_this_badge?(badge)
        @user.badges << badge
      end
    end
  end

  private

  def set_variables
    @user = @test_passage.user
    @test = @test_passage.test
    @category = @test.category
    @level = @test.level
  end

  def category_success_condition(value)
    (@category.tests.pluck(:id) - @user.test_passages.where(success: true).pluck(:test_id)).empty? && value == @category.title
  end

  def first_attemp_condition(value)
    TestPassage.where(user_id: @user.id).where(test_id: @test.id).where(success: true).count == 1 && value == @test.title
  end

  def level_success_condition(value)
    (Test.all.where(level: @level).pluck(:id) - @user.test_passages.where(success: true).pluck(:test_id)).empty? && value.to_i == @level
  end

  def not_has_this_badge?(badge)
    !@user.badges.include? badge
  end
end
