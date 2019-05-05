class CreateWorksheets < ActiveRecord::Migration[5.2]
  def change
    create_table :worksheets do |t|
      t.string :comments

      t.timestamps
    end
  end
end
