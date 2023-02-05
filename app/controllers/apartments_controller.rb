class ApartmentsController < ApplicationController
  def index
    apartments = Apartment.all
    render json: apartments, status: :ok
  end

  def show
    find_apartment
    render json: @apartment, status: :ok
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def update
    find_apartment
    @apartment.update!(apartment_params)
    render json: @apartment, status: :ok
  end

  def destroy
    find_apartment
    @apartment.destroy
  end

  private

  def apartment_params
    params.permit(:number)
  end

  def find_apartment
    @apartment = Apartment.find(params[:id])
  end
end
