class AddForeignKeyToRenter < ActiveRecord::Migration[6.1]
  def change
    add_reference :renters, :rental, null: false, foreign_key: true
  end
end
