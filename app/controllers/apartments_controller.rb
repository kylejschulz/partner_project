class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  def index
    @apartments = Apartment.sort
  end

  def new
    @apartment = Apartment.new
  end

  def show
    apa = Apartment.first
    apa.other_method(params)
  end

  def create
    if params[:apartment][:luxury] == 'on'
      params[:apartment][:luxury] = true
    else params[:apartment][:luxury].nil?
      params[:apartment][:luxury] = false
    end
    @apartment = Apartment.new(apartment_params)

    if @apartment.save
      redirect_to '/apartments'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:apartment][:luxury] == 'on'
      params[:apartment][:luxury] = true
    else params[:apartment][:luxury].nil?
      params[:apartment][:luxury] = false
    end
    @apartment.update(apartment_params)

    @apartment.save
    redirect_to "/apartments/#{@apartment.id}"
  end

  def destroy
    @apartment.destroy
    redirect_to '/apartments'
  end

  private

  def apartment_params
    params.require(:apartment).permit(:name, :years_old, :units, :luxury)
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
end
