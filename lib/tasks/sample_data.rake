namespace :db do
	desc "Fill database with samtle data"
	task populate: :environment do
		User.create!(name: "Example User",
					 email: "example@railstutorial.org",
					 password: "foobar",
					 password_confirmation: "foobar")
		User.create!(name: "Ugene",
					 email: "Arucard2009@yandex.ru",
					 password: "arucard",
					 password_confirmation: "arucard",
					 admin: true)
		999.times do	|n|
			name = Faker::Name.name
			email ="example-#{n+1}@railstutorial.org"
			password="12345"
			User.create!(name: name,
						 email: email,
						 password: password,
						 password_confirmation: password)
		end
		users = User.first(6)
    	50.times do
      		content_word = Faker::Lorem.word.to_s
      		content_translate = Faker::Lorem.word.to_s
      		users.each { |user| user.words.create!(foreign_words: content_word, translation: content_translate) }
    	end
	end
end