class User < ActiveRecord::Base
	has_mamy :words, dependent: :destroy
end
