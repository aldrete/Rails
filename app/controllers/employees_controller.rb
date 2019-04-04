class EmployeesController < ApplicationController
  
  def index
    @employee = Employee.all
  end

  def show
    @employee = Employee.find_by(params[:Employeeid])  
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(emp_params)   
    if @employee.save   
      flash[:notice] = 'employee added!'   
      redirect_to employees_index_path   
    else   
      flash[:error] = 'Failed to edit employee!'   
      render :new   
    end   
  end

  def edit
    @employee = Employee.find(params[:id])  
  end

  def update
    @employee = Employee.find(params[:id]) 
    if @employee.update_attributes(emp_params)   
      flash[:notice] = 'employee updated!'   
      redirect_to employees_index_path   
    else   
      flash[:error] = 'Failed to edit employee!'   
      render :edit   
    end   
  end

  def destroy
    @employee = Employee.find(params[:id])   
    if @employee.delete   
      flash[:notice] = 'employee deleted!'   
      redirect_to employees_index_path   
    else   
      flash[:error] = 'Failed to delete this employee!'   
      render :destroy   
    end
  end

  private
  def emp_params   
    params.require(:employee).permit(:company_name , :name, :rfc, :position)
  end 
 
end
