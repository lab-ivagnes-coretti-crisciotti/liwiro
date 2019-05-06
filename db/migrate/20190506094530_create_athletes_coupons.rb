class CreateAthletesCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes_coupons do |t|
      t.references :athlete, foreign_key: true
      t.references :coupon, foreign_key: true

      t.timestamps
    end
  end
end
