class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :street_name
      t.string :Colony_name
      t.integer :ext_num
      t.integer :int_num
      t.integer :zip_code
      t.string :city
      t.string :country
      t.timestamps
    end
  end
end
