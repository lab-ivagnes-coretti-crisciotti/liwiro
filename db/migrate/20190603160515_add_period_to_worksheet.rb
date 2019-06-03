class AddPeriodToWorksheet < ActiveRecord::Migration[5.2]
  def change
    add_column :worksheets, :start, :date
    add_column :worksheets, :end, :date
  end
end
