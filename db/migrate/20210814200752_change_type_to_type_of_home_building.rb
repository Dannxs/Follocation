class ChangeTypeToTypeOfHomeBuilding < ActiveRecord::Migration[6.1]
  def change
    rename_column :rentals, :type, :type_of_home
  end
end
