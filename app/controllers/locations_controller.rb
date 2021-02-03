class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new

  end

  def create
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
end
