class AddDetailsToFoodtrucks < ActiveRecord::Migration[7.1]
  def change
    add_column :foodtrucks, :company_name, :string
    add_column :foodtrucks, :photo, :string
  end
end
