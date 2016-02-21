class WordsController < ApplicationController
	before_action :nead_login, 		only: [:edit, :destroy, :update]
	before_action :correct_user,		only: [:edit]
	def index
		@params=params
	end

	def show

	end

	def repeat
		@user=User.find(params[:user_id])
		@old_words=@user.words.where.not(created_at: (Time.now - 2.day)..Time.now).paginate(page: params[:page], per_page: "15")
	end

	def create
		@user=User.find(params[:user_id])
		@word=current_user.words.build(word_params)
		@count_words=@user.words.count
   		@count_old_words=@user.words.where.not(created_at: (Time.now - 2.day)..Time.now).paginate(page: params[:page], per_page: "15").count
   		@bar=for_progress_bar(@count_old_words, @count_words, @user.count_words)
		if @word.save
			flash[:success]="Word added"
			redirect_to current_user
		else
			render 'users/show'
		end
	end


	def destroy
		
	end

	private

	def word_params
		params.require(:word).permit(:foreign_words, :translation)
	end
end
