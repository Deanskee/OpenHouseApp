class SessionsController < ApplicationController
  def new
  	@users = User.new
  end

  def create
  		# if params[:session][:email].present?
  			# @user = User.find_or_create_by(email: params[:session][:email])
  			# if @user == nil || !@user.authenticate(params[:session][:password])
  				# flash[:error] = "invalid email!"
  					# render 'new'
  			 # else
  			 		# session[:token] = @user.id.to_s
  			 		# @current_user = @user
  			 		# redirect_to root_path
  	@user = User.where(:email => params[:session][:email]).first
  	if @user && @user.authenticate(params[:session][:password])
  		# params session password is what the user puts into password. passing into authenticate
  		flash[:success] = "HELLO " + @user.full_name + " You have logged in"
  		cookies[:token] = @user.token
  		redirect_to user_path(@user)
  	  else
  		flash[:error] = "Invalid email/password combination"
  		render 'new'
  	  end
  	end

  def destroy
    reset_session
  	cookies.delete(:token)
  	redirect_to root_path
  end

end
