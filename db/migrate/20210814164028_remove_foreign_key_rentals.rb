class RemoveForeignKeyRentals < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :buildings, :rental
  end
end
