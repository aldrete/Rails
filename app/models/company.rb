class Company < ApplicationRecord
    validates :company_name, presence: true  
    validates :street_name, presence: true  
    validates :Colony_name, presence: true  
    validates :city, presence: true  
    validates :country, presence: true  
    validates :ext_num, presence: true, numericality: {:greater_than => 0} 
    validates :int_num, presence: true, numericality: {:greater_than => 0}   
    validates :zip_code, presence: true, numericality: {:greater_than => 0}   
end
