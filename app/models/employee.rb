class Employee < ApplicationRecord
    validates :company_name, presence: true  
    validates :name, presence: true  
    validates :rfc, presence: true  
    validates :position, presence: true  
end
