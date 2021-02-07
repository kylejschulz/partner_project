class LocationMembersController < ApplicationController
  def index
    @location = Location.find(params[:id])
    @members = @location.sort_alpha
  end

  def new
    @location = Location.new
    @member = Location.find(params[:id])
  end
end
