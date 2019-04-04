class AddExtraFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username,:string
    add_column :users, :company,:string
    add_column :users, :rfc, :string
  end
end
