class UsersController < ApplicationController
  before_action :nead_login,        only:      [:update, :destroy]
  before_action :correct_user,      only:      [:update]
  before_action :only_admin,        only:      [:destroy]
  before_action :onli_not_login,    only:      [:new, :create]
  def index
  	@users=User.all
  end

  def show
  	@user=User.find(params[:id])
    @words=@user.words
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
  def edit
    @user=User.find(params[:id])
  end
  def update
    @user=User.find(params[:id])
    if @user.update_atributes(user_params)
      flash[:success]='Chenge is saved'
      redirect_to @user
    else
      render 'edit'
    end
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
    unless signed_in?
      store_location
      flash[:warning]= "You mast login or #{view_context.link_to( 'sign up', new_users_path)} first."  #{link_to 'Sign up', new_users_path} 
      redirect_to new_session_path
    end
  end

  def correct_user
    unless correct_user?
      flash[:error]="Sorry bat only admins can do it"
      redirect_to root_pats
    end
  end

  def only_admin
    unless current_user.admin?
      flash[:error]="Thory bat only admins can do it"
      redirect_to :back
    end
  end
end
