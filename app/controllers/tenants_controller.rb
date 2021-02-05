class TenantsController < ApplicationController
  def index
    @tenants = Tenant.all
  end

  def new
    @tenant = Tenant.new
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def create
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

    @tenant.save
    redirect_to '/tenants'
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def update
    tenant = Tenant.find(params[:id])
    if params[:tenant][:on_strike] == 'on'
      params[:tenant][:on_strike] = true
    else params[:tenant][:on_strike].nil?
      params[:tenant][:on_strike] = false
    end
    tenant.update({
      name: params[:tenant][:name],
      age: params[:tenant][:age],
      apartment_id: params[:tenant][:apartment_id],
      on_strike: params[:tenant][:on_strike]
      })

    tenant.save

    redirect_to '/tenants'
  end

  def destroy
    Tenant.destroy(params[:id])
    redirect_to '/tenants'
  end
end
