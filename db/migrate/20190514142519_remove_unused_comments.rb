class RemoveUnusedComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :comments
    remove_column :gyms, :comments
    add_column :coupons, :name, :string
  end
end
