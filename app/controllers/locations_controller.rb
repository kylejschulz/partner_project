class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    if params[:location][:lead_wall] == 'on'
      params[:location][:lead_wall] = true
    else params[:location][:lead_wall].nil?
      params[:location][:lead_wall] = false
    end
    location = Location.new({
      city: params[:location][:city],
      square_footage: params[:location][:square_footage],
      lead_wall: params[:location][:lead_wall]
      })
    location.save
    redirect_to '/locations'
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    if params[:location][:lead_wall] == 'on'
      params[:location][:lead_wall] = true
    else params[:location][:lead_wall].nil?
      params[:location][:lead_wall] = false
    end
    location = Location.find(params[:id])
    location.update({
      city: params[:location][:city],
      square_footage: params[:location][:square_footage],
      lead_wall: params[:location][:lead_wall]
      })
    location.save
    redirect_to "/locations/#{location.id}"
  end

  def destroy
    Location.destroy(params[:id])
    redirect_to '/locations'
  end
end
