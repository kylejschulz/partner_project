class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new

  end

  def create
    if params[:member][:monthly_membership] == 'on'
      params[:member][:monthly_membership] = true
    else params[:member][:monthly_membership].nil?
      params[:member][:monthly_membership] = false
    end
    if params[:member][:yearly_membership] == 'on'
      params[:member][:yearly_membership] = true
    else params[:member][:yearly_membership].nil?
      params[:member][:yearly_membership] = false
    end
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
    if params[:member][:monthly_membership] == 'on'
      params[:member][:monthly_membership] = true
    else params[:member][:monthly_membership].nil?
      params[:member][:monthly_membership] = false
    end
    if params[:member][:yearly_membership] == 'on'
      params[:member][:yearly_membership] = true
    else params[:member][:yearly_membership].nil?
      params[:member][:yearly_membership] = false
    end
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
