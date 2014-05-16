module ApplicationHelper
def current_user
  # raise session[:remember_token]
  if session[:token]
  	@current_user ||= session[:token]
  	 # @current_user ||= User.find([:token])
  	# @current_user ||= User.find_by(token: session[:token])
  else
  	@current_user = nil
  end
end

def authenticate_user
	if !self.current_user 
		redirect_to new_session_path
	end
end  

end
# if nobody's logged in you have to log in