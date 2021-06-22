class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :renters, :gender, :mister
  end
end
