class AddOmniauthToAthletes < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :provider, :string
    add_column :athletes, :uid, :string
  end
end
