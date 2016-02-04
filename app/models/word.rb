class Word < ActiveRecord::Base
	belonge_to :user, dependent: :destroy
end
