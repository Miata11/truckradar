class CreateFoodtrucks < ActiveRecord::Migration[7.1]
  def change
    create_table :foodtrucks do |t|
      t.string :name
      t.string :phone_number
      t.string :category
      t.text :description
      t.string :address_default
      t.decimal :latitude
      t.decimal :longitude
      t.boolean :status, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
