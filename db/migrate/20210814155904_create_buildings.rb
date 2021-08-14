class CreateBuildings < ActiveRecord::Migration[6.1]
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :country
      t.string :city
      t.string :postal_code
      t.string :construction_year
      t.timestamps
    end
  end
end
