class AddGenderToRenters < ActiveRecord::Migration[6.1]
  def change
    add_column :renters, :gender, :string
  end
end
