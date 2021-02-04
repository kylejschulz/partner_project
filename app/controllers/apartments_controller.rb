class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
  end

  def new

  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def create
    apartment = Apartment.new({
      name: params[:apartment][:name],
      years_old: params[:apartment][:years_old],
      units: params[:apartment][:units]
      #if params[:apartment][:luxury] = 'off'

                    })

      apartment.save
      redirect_to '/apartments'
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:id])
    @apartment.update({
      name: params[:apartment][:name],
      years_old: params[:apartment][:years_old],
      units: params[:apartment][:units]
      })
    @apartment.save
    redirect_to '/apartments'
  end

  def destroy
    Apartment.destroy(params[:id])
    redirect_to '/apartments'
  end
end
