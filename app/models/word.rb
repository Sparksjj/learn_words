class Word < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :foreign_words, :translation, presence: true
end
