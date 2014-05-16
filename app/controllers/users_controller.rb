class UsersController < ApplicationController
  # def index

  # end

  def show
    @user = User.find_by(token: params[:id])
    # User.find_by
    # Agent.find_by
    # Manager.find_by
  end

  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have signed up successfully"
      session[:token] = @user.id
      @current_user = @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
