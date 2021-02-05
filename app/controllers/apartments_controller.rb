class ApartmentsController < ApplicationController
  def index
    @apartments = Apartment.all
  end

  def new
    @apartment = Apartment.new
  end

  def show
    @apartment = Apartment.find(params[:id])
  end

  def create
    if params[:apartment][:luxury] == 'on'
      params[:apartment][:luxury] = true
    else params[:apartment][:luxury].nil?
      params[:apartment][:luxury] = false
    end
    @apartment = Apartment.new({
      name: params[:apartment][:name],
      years_old: params[:apartment][:years_old],
      units: params[:apartment][:units],
      luxury: params[:apartment][:luxury]
                    })

      if @apartment.save
        redirect_to '/apartments'
      else
        render 'new'
      end
  end

  def edit
    @apartment = Apartment.find(params[:id])
  end

  def update
    @apartment = Apartment.find(params[:id])
    if params[:apartment][:luxury] == 'on'
      params[:apartment][:luxury] = true
    else params[:apartment][:luxury].nil?
      params[:apartment][:luxury] = false
    end
    @apartment.update({
      name: params[:apartment][:name],
      years_old: params[:apartment][:years_old],
      units: params[:apartment][:units],
      luxury: params[:apartment][:luxury]
      })

    @apartment.save
    redirect_to '/apartments'
  end

  def destroy
    Apartment.destroy(params[:id])
    redirect_to '/apartments'
  end
end
