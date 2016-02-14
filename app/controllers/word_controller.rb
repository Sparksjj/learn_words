class WordController < ApplicationController
		before_action :nead_login, 		only: [:edit, :destroy, :update, :repeat]
		before_action :correct_user,	only: [:edit, :repeat]
	def show
		@user=User.find(params[:id])
		@words=@user.words.paginate(page: params[:page], per_page: "15")
	end

	def repeat
		@user=User.find(params[:id])
		@old_words=@user.words.where.not(created_at: (Time.now - 2.day)..Time.now).paginate(page: params[:page], per_page: "15")
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end
end
