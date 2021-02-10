class ApartmentTenantsController < ApplicationController
  before_action :set_apartment, only: [:index, :new, :show, :edit, :create, :update, :destroy]
  def index
    if params[:tenant_age].nil?
      @tenants = @apartment.tenant
    else
      @tenants = @apartment.sort(params[:tenant_age])
    end
    if params[:sort_param]
      @tenants = @apartment.sort_alpha
    end
  end

  def new
    @tenant = Tenant.new
  end

  def create
    if params[:tenant][:on_strike] == 'on'
      params[:tenant][:on_strike] = true
    else params[:tenant][:on_strike].nil?
      params[:tenant][:on_strike] = false
    end
    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      flash[:notice] = "Tenant successfully created"
      redirect_to "/apartments/#{@apartment.id}/tenants"
    else
      render 'new'
    end
  end

  private

  def tenant_params
    params.require(:tenant).permit(:name, :age, :apartment_id, :on_strike)
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
end
