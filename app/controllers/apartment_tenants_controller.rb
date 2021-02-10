class ApartmentTenantsController < ApplicationController

  def index
    #if params[:commit] == 'Sort Apartments Alphabetically'
      # @tenants = @apartment.tenant.sort_alpha
    # end
    @apartment = Apartment.find(params[:id])
    @tenants = @apartment.tenant
    require "pry"; binding.pry
  end

  def new
    @tenant = Tenant.new
    @apartment = Apartment.find(params[:id])
  end

  def create
    @apartment = Apartment.find(params[:id])

    if params[:tenant][:on_strike] == 'on'
      params[:tenant][:on_strike] = true
    else params[:tenant][:on_strike].nil?
      params[:tenant][:on_strike] = false
    end
    @tenant = Tenant.new({
      name: params[:tenant][:name],
      age: params[:tenant][:age],
      apartment_id: params[:tenant][:apartment_id],
      on_strike: params[:tenant][:on_strike]
                    })
    if @tenant.save
      flash[:notice] = "Tenant successfully created"
      redirect_to "/apartments/#{@apartment.id}/tenants"
    else
      render 'new'
    end


  end
end
