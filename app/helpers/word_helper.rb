module WordHelper
	def have_count_words(user)
		unless user.count_words.nil?
		 	" from #{user.count_words}"
		 end 
	end

	def for_progress_bar(old_words, count_words, user)
		if count_words.to_i==0
			return [0, 0]
		else
			if old_words.to_i==0
				green=(count_words*100)/user
				return [green, 0]
			else	
				if user.to_i==0
					yelow=(old_words*100)/count_words
					green=100-yelow
					return [green, yelow]
				else
					buff=(count_words*100)/user
					yelow=(old_words*buff)/count_words
					green=buff-yelow
					return [green, yelow]
				end				
			end
		end
	end

end 