class AddGymToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :gym_id, :integer
  end
end
