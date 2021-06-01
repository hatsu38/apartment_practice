class DepartmentsController < ApplicationController

  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.valid?
      @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  private

  private

  def current_company
    Company.find_by(subdomain: Apartment::Tenant.current)
  end

  def department_params
    params.require(:department).permit(:name).merge(company_id: current_company.id)
  end
end
