class CreateRenters < ActiveRecord::Migration[6.1]
  def change
    create_table :renters do |t|
      t.string :first_name
      t.string :last_name
      t.string :mail
      t.integer :phone_number

      t.timestamps
    end
  end
end
