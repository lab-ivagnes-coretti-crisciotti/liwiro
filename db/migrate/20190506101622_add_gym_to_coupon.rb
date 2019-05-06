class AddGymToCoupon < ActiveRecord::Migration[5.2]
  def change
    add_column :coupons, :gym_id, :integer
  end
end
