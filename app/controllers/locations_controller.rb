class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new

  end

  def create
    location = Location.new({
      name: params[:location][:name],
      square_footage: params[:location][:square_footage]
      })
    location.save
    redirect_to '/locations'
  end

  def show
    @location = Location.find(params[:id])
  end
end
