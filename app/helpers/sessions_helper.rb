module SessionsHelper

	def sign_in(user)
		remember_token=User.new_remember_token
		cookies.permanent[:remember_token]=remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user=user
	end

	def current_user=(user)
		@current_user=user
	end

	def current_user
		remember_token=User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def signed_in?
		!current_user.nil?
	end
	
 	def sign_out
 		current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
 		cookies.delete(:remember_token)
 		self.current_user=nil
 	end

 	def correct_user?
		user=User.find(params[:id])
		current_user==user 		
 	end 

 	def redirect_back_or(default)
 		redirect_to(session[:return_to] || default)
 		session[:return_to]
 	end
 	
 	def store_location
 		session[:return_to]=request.url if request.get?
 	end

 	def only_not_login
    	if signed_in?
    	  flash[:warning] = "Yor mast #{view_context.link_to('sign out', signout_path, method: 'delete')} first"
    	  redirect_to :back
    	end
  	end
end
