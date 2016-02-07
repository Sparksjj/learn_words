class User < ActiveRecord::Base
	before_save {self.email.downcase!}
	before_create :crete_remember_token
	has_many :words, dependent: :destroy
	has_secure_password
	validates :password, length: {minimum: 4}
	validates :name, presence: true, length: {minimum: 3}
	EMAIL_FORMAT=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: {with: EMAIL_FORMAT}, uniqueness: { case_sensitive: false }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def crete_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end