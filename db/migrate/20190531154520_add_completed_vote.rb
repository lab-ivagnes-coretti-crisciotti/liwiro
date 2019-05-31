class AddCompletedVote < ActiveRecord::Migration[5.2]
  def change
    add_column :worksheets, :completed, :boolean
    add_column :gym_reviews, :stars, :integer
    change_column :athletes, :height, :float
    change_column :athletes, :weight, :float
  end
end
