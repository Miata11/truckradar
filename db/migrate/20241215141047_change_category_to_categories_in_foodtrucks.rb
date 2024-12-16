class ChangecategoriesToCategoriesInFoodtrucks < ActiveRecord::Migration[7.1]
  def change
    remove_column :foodtrucks, :category, :string
    add_column :foodtrucks, :categories, :string, array: true, default: []
  end
end
