class ChangePhoneToBeStringInRenters < ActiveRecord::Migration[6.1]
  def change
    change_column :renters, :phone_number, :string
  end
end
