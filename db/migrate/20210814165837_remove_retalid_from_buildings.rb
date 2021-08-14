class RemoveRetalidFromBuildings < ActiveRecord::Migration[6.1]
  def change
    remove_reference :buildings, :rental
  end
end
