class CreateAthletesCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes_courses do |t|
      t.references :athlete, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
