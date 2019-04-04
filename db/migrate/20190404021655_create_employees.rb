class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :rfc
      t.string :position

      t.timestamps
    end
  end
end
