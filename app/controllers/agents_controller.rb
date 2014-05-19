class AgentsController < ApplicationController
  # before_filter :authorize, except: [:new, :create]
  def index
    @agents = Agent.all
  end

  def show
    @agent = Agent.find_by(token: params[:id])
  end

  def new
    @agent = Agent.new
    @visitor = Visitor.new
  end

  def create
    @agent = Agent.new(params.require(:agent).permit(:first_name, :last_name, :email))
    if @agent.save
        redirect_to agents_path, notice: "Agent was successfully created."
    else 
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