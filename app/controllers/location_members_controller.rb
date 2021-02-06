class LocationMembersController < ApplicationController
  def index
    @location = Location.find(params[:id])
    @members = @location.member
  end

end
