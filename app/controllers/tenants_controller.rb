class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def new

  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def create
    @tenant = Tenant.new({
      name: params[:tenant][:name],
      age: params[:tenant][:age],
      apartment_id: params[:tenant][:apartment_id]
                    })

      @tenant.save
      redirect_to '/tenants'
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def update
    tenant = Tenant.find(params[:id])
    tenant.update({
      name: params[:tenant][:name],
      age: params[:tenant][:age],
      apartment_id: params[:tenant][:apartment_id]
      })
      # require "pry"; binding.pry
    tenant.save
    redirect_to '/tenants'
  end

  def destroy
    Tenant.destroy(params[:id])
    redirect_to '/tenants'
  end
end
