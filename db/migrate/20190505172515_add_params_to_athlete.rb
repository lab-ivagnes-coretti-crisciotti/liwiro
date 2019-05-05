class AddParamsToAthlete < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :name, :string
    add_column :athletes, :surname, :string
    add_column :athletes, :height, :integer
    add_column :athletes, :weight, :integer
    add_column :athletes, :age, :integer
  end
end
