class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location= Location.find(params[:id])
    @agent_id = Agent.find_by(token: params[:token])
  end

  def new
    @location= Location.new
    @agent_id = Agent.find_by(token: params[:token])
  end
    

  def create
     @location = Location.new(params.require(:location).permit(:address, :zip_code, :owner))
     
    if @location.save
        redirect_to locations_path, notice: "Location was successfully created."
    else 
        render action:'new'
  end
  end

  def edit
    @location= Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to locations_path, notice: "Location was successfully updated"
    else
      render action: 'edit'  
  end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_path
  end
  end

