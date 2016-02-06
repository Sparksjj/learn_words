module ApplicationHelper
	def full_title(title)
		base_title='LW'
		if title.empty?
			base_title
		else
			"#{base_title} | #{title}"
		end		
	end

	def gravatar_for
		
	end
end
