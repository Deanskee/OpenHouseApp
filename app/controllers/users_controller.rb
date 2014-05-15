class UsersController < ApplicationController
  def index

  end

  def show

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
      redirect_to :root
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
