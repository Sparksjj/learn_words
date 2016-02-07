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

	#def bootstrap_class_for flash_type
    	#type={ success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }
    	#return type[flash_type].to_s
  	#end

 	def flash_messages(opts = {})
    	flash.each do |msg_type, message|
      		concat(content_tag(:div, message, class: "alert alert-#{msg_type.to_s} fade in") do 
            concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
            concat message 
            end)
    end
    nil
  end
end
