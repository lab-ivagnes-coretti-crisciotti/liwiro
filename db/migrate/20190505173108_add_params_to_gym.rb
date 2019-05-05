class AddParamsToGym < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :name, :string
    add_column :gyms, :adress, :string
    add_column :gyms, :price, :float
    add_column :gyms, :latitude, :decimal
    add_column :gyms, :longitude, :decimal
  end
end
