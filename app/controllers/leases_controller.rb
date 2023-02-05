class LeasesController < ApplicationController

  def create
    lease = Lease.create!(lease_params)
    render json: lease, status: :created
  end

  def destroy
    find_lease
    @lease.destroy
  end

  private

  def lease_params
    params.permit(:rent, :tenant_id, :apartment_id)
  end

  def find_lease
    @lease = Lease.find(params[:id])
  end
end
