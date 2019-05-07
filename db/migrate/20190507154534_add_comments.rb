class AddComments < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :comments, :text, array: true, default: []
    add_column :courses, :comments, :text, array: true, default: []
    add_column :worksheets, :exercises, :text, array: true, default: []
  end
end
