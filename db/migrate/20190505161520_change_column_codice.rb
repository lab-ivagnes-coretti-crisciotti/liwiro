class ChangeColumnCodice < ActiveRecord::Migration[5.2]
  def change
    rename_column :coupons, :codice, :code
  end
end
