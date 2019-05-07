class ChangeTextType < ActiveRecord::Migration[5.2]
  def change
    change_column :coupons, :description, :text
    change_column :courses, :description, :text
    change_column :worksheets, :comments, :text
  end
end
