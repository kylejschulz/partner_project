class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new

  end

  def create
    member = Member.new({
      primary_member: params[:member][:primary_member],
      monthly_membership: params[:member][:monthly_membership],
      yearly_membership: params[:member][:yearly_membership],
      people_in_membership: params[:member][:people_in_membership],
      location_id: params[:member][:location_id]
      })
    member.save
    redirect_to '/members'
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update({
      primary_member: params[:member][:primary_member],
      monthly_membership: params[:member][:monthly_membership],
      yearly_membership: params[:member][:yearly_membership],
      people_in_membership: params[:member][:people_in_membership]
      })
      member.save
      redirect_to "/members/#{member.id}"
  end

  def destroy
    Member.destroy(params[:id])
    redirect_to '/members'
  end
end
