class UsersController < ApplicationController
  before_action :nead_login,        only:      [:update, :destroy, :edit]
  before_action :correct_user,      only:      [:update, :edit]
  before_action :only_admin,        only:      [:destroy]
  before_action :only_not_login,    only:      [:new, :create]
  def index
  	@users=User.paginate(page: params[:page], per_page: "15")
  end

  def show
  	@user=User.find(params[:id])
    @count_words=@user.words.count
    @count_old_words=@user.words.where.not(created_at: (Time.now - 2.day)..Time.now).paginate(page: params[:page], per_page: "15").count
    @bar=for_progress_bar(@count_old_words, @count_words, @user.count_words)
  end

  def new
  	@user=User.new
  end

  def create
  	@user=User.new(user_params)
  	if @user.save
  		 
       (@user)
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
    if @user.update_attributes(user_params)
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
  	params.require(:user).permit(:name, :email, :password, :password_confirmation, :count_words)
  end

  private

  def only_admin
    unless current_user.admin? && signed_in?
      flash[:errore]="Sorry bat only admins can do it"
      redirect_to :back
    end
  end
end
