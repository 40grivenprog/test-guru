module BadgesHelper

	def badge_desc(badge)
		case badge.badge_type
    when 'Success Passing'
      'Test: ' + badge.value
    when 'Success Passing Category'
      'Category: ' + badge.value
    when 'Success Passing by Level'
      'Level: ' + badge.value
    end
	end

end
