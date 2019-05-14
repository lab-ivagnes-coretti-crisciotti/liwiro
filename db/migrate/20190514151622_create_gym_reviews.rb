class CreateGymReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_reviews do |t|
      t.text :text
      t.references :athlete, foreign_key: true
      t.references :gym, foreign_key: true

      t.timestamps
    end
  end
end
