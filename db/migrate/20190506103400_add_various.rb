class AddVarious < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :description, :string
    add_column :courses, :description, :string
  end
end
