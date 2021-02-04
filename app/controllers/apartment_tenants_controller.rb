class ApartmentTenantsController < ApplicationController

  def index
    @apartment = Apartment.find(params[:id])
    @tenants = @apartment.tenant
  end

  def new
    @apartment = Apartment.find(params[:id])
    @tenants = @apartment.tenant
  end

  def create

  end
end
