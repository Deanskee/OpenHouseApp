class AgentsController < ApplicationController
  # before_filter :authorize, except: [:new, :create]
  # before_action :authenticate_user
  def index
    @agents = current_user.agents
  end

  def show
    @agent = Agent.find_by(token: params[:id])
  end

  def new
    @agent = Agent.new
    @visitor = Visitor.new
  
  end

  def create
    @agent = Agent.new(params.require(:agent).permit(:first_name, :last_name, :email, :picture))
    @user_id = User.find_by(id: current_user.id)
    @agent.user_id = @user_id.id
    if @agent.save
        redirect_to agent_path(@agent), notice: "Agent was successfully created."
    else 
      raise(params.inspect)
        render action:'new'
  end
end

  def edit
    @agent = Agent.find_by(token: params[:id])
  end

  def update
    @agent = Agent.find_by(token: params[:id])
    if @agent.update(agent_params)
      redirect_to agents_path, notice: "Agent was successfully updated"
    else
      render action: 'edit'  
  end
end

  def destroy
    @agent = Agent.find_by(token: params[:id])
    @agent.destroy
    redirect_to agents_path
  end


private

  def agent_params
      params.require(:agent).permit(:first_name, :last_name, :email)
  end

end