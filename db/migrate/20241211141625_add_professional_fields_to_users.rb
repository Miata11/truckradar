class AddProfessionalFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :siret, :string
    add_column :users, :company_name, :string
  end
end
