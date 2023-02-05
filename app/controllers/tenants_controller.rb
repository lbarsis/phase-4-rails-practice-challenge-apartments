class TenantsController < ApplicationController
  def index
    tenants = Tenant.all
    render json: tenants, status: :ok
  end

  def show
    find_tenant
    render json: @tenant, status: :ok
  end

  def create
    tenant = Tenant.create!(tenant_params)
    render json: tenant, status: :created
  end

  def update
    find_tenant
    @tenant.update!(tenant_params)
    render json: @tenant, status: :ok
  end

  def destroy
    find_tenant
    @tenant.destroy
  end

  private

  def tenant_params
    params.permit(:name, :age)
  end

  def find_tenant
    @tenant = Tenant.find(params[:id])
  end
end
