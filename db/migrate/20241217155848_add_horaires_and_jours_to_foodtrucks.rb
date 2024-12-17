class AddHorairesAndJoursToFoodtrucks < ActiveRecord::Migration[7.1]
  def change
    add_column :foodtrucks, :horaires, :string
    add_column :foodtrucks, :jours, :string
  end
end
