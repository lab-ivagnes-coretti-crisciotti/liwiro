class ChangeToNameToUsername < ActiveRecord::Migration[5.2]
  def change
    rename_column :gyms, :name, :username
    rename_column :athletes, :name, :username
    remove_column :athletes, :lastname
  end
end
