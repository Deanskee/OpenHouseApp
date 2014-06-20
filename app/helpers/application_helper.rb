module ApplicationHelper
def current_user
  	@current_user ||= User.find_by(token: cookies[:token]) if cookies[:token].present?
end

def authenticate_user
	if !current_user 
		redirect_to new_sessions_path
	end
end  
# this could be here but was suggested to put in application controller
end
# if nobody's logged in you have to log in