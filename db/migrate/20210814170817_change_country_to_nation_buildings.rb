class ChangeCountryToNationBuildings < ActiveRecord::Migration[6.1]
  def change
    rename_column :buildings, :country, :nation
  end
end
