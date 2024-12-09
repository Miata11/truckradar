class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :boolean, default: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address_default, :string
    add_column :users, :latitude, :decimal
    add_column :users, :longitude, :decimal
  end
end
