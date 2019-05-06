class AddAthleteIdToWorksheets < ActiveRecord::Migration[5.2]
  def change
    add_column :worksheets, :athlete_id, :integer
    add_column :worksheets, :gym_id, :integer
  end
end
