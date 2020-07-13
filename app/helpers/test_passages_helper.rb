# frozen_string_literal: true

module TestPassagesHelper
	def time_format(time)
		time.gsub!(/h|m/, ':').gsub!('s', '')
		time.split(":").map! do |num|
			num.length == 2 ? num : "0" + num
		end.join(":")
	end
end
