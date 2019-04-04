class CompaniesController < ApplicationController
 
  def index
    @companies = Company.all
  end

  def show
    @companies = Company.find_by(params[:Companyid])  
  end

  def new
    @companies = Company.new
  end

  def create
    @companies = Company.new(carams)   
    if @companies.save   
      flash[:notice] = 'company added!'   
      redirect_to companies_index_path   
    else   
      flash[:error] = 'Failed to edit company!'   
      render :new   
    end   
  end

  def edit
    @companies = Company.find(params[:id])  
  end

  def update
    @companies = Company.find(params[:id]) 
    if @companies.update_attributes(carams)   
      flash[:notice] = 'company updated!'   
      redirect_to companies_index_path   
    else   
      flash[:error] = 'Failed to edit company!'   
      render :edit   
    end   
  end

  def destroy
    @companies = Company.find(params[:id])   
    if @companies.delete   
      flash[:notice] = 'company deleted!'   
      redirect_to companies_index_path   
    else   
      flash[:error] = 'Failed to delete this company!'   
      render :destroy   
    end
  end

  private
  def carams   
    params.require(:company).permit(:company_name, :street_name, :Colony_name, :ext_num, :int_num, :zip_code, :city, :country)
  end 
 
end
