class UsersController < ApplicationController
  before_action :nead_login, only: [:update, :destroy]

  def index
  	@users=User.all
  end

  def show
  	@user=User.find(params[:id])
  end

  def new
  	@user=User.new
  end

  def create
  	@user=User.new(user_params)
  	if @user.save
  		sign_in(@user)
  		flash[:success]="Welcome a board, #{@user.name}!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def update
    
  end

  def destroy
  	@user=User.find(params[:id])
  	@user.destroy
  	flash[:success]="User #{@user.name} has been deleted"
  	redirect_to users_path
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  private

  def nead_login
    if signed_in?
      flash[:waring]= "You mast #{link_to 'Sign in', new_sessions_path} or #{link_to 'Sign up', new_users_path} first."
      redirect_to new_sessions_path
    end
  end
end
