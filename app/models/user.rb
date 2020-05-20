require 'pry'
class User < ApplicationRecord
	def test_by_level(level)
		Test.joins('JOIN tests_users ON tests.id = tests_users.test_id').where('tests_users.user_id = ? and tests.level = ?', self.id, level)
	end
end
