class CompaniesController < ApplicationController
  protect_from_forgery
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.valid?
      ApplicationRecord.transaction do
        @company.save
        Apartment::Tenant.create(@company.subdomain)
      end
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :subdomain)
  end
end
