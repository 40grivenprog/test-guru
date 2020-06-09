module SessionsHelper
	def flash_message(alert)
		content_tag :h3, flash[:alert], :style => "color: red" if alert
	end
end
