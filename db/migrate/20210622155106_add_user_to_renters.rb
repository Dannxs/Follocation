class AddUserToRenters < ActiveRecord::Migration[6.1]
  def change
    add_reference :renters, :user, null: false, foreign_key: true
  end
end
