class RenameAttributes < ActiveRecord::Migration[5.2]
  def change
    rename_column :gyms, :adress, :address
    rename_column :athletes, :surname, :lastname
    add_column :gyms, :likes, :integer
  end
end
