class CreateAthletesGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes_gyms do |t|
      t.references :athlete, foreign_key: true
      t.references :gym, foreign_key: true

      t.timestamps
    end
  end
end
