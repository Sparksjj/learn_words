class User < ActiveRecord::Base
	has_many :words, dependent: :destroy
end
