class LocationMembersController < ApplicationController
  def index
    @location = Location.find(params[:id])
    @members = @location.sort_alpha
  end

  def new
    @member = Member.new
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.find(params[:id])
    if params[:member][:monthly_membership] == 'on'
      params[:member][:monthly_membership] = true
    else params[:member][:monthly_membership].nil?
      params[:member][:monthly_membership] = false
    end
    @member = Member.new({
      primary_member: params[:member][:primary_member],
      monthly_membership: params[:member][:monthly_membership],
      people_in_membership: params[:member][:people_in_membership],
      location_id: params[:member][:location_id]
      })
    @member.save
    redirect_to "/location/#{@location.id}/members"
  end
end
