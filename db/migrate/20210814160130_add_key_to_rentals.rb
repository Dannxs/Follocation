class AddKeyToRentals < ActiveRecord::Migration[6.1]
  def change
    add_reference :buildings, :rental, null: false, foreign_key: true
  end
end
