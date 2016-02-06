class User < ActiveRecord::Base
	has_many :words, dependent: :destroy
	has_secure_password
	validates :password, length: {minimum: 4}
	validates :name, presence: true, length: {minimum: 3}
	EMAIL_FORMAT=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: {with: EMAIL_FORMAT}, uniqueness: { case_sensitive: false }
end