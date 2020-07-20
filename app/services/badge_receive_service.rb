class BadgeReceiveService
  def initialize(test_passage)
  	@user = test_passage.user
  	@test = test_passage.test
  	@category = @test.category
  	@level = @test.level
  	@test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if success_cat_condition(badge.value) && not_has_this_badge?(badge)
      @user.badges << badge if first_attemp_condition(badge.value)
      @user.badges << badge if success_level_condition(badge.value) && not_has_this_badge?(badge)
    end
  end

  private

  def success_cat_condition(value)
  	(@category.tests.pluck(:id) - @user.test_passages.where(success: true).pluck(:test_id)).empty? && value == @category.title
  end

  def first_attemp_condition(value)
    TestPassage.where(user_id: @user.id).where(test_id: @test.id).where(success: true).count == 1 && value == @test.title
  end

 	def success_level_condition(value)
 	  (Test.all.where(level: @level).pluck(:id) - @user.test_passages.where(success: true).pluck(:test_id)).empty? && value.to_i == @level
 	end

  def not_has_this_badge?(badge)
    !@user.badges.include? badge
  end

end
