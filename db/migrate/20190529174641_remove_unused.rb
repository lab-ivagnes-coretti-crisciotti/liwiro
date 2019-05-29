class RemoveUnused < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :likes
    remove_column :gyms, :price
    remove_column :gyms, :likes
  end
end
