class AddCompanyNametoEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :company_name, :string
  end
end
