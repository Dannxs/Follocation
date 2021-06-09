class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.string :address
      t.string :country
      t.string :city
      t.string :postal_code
      t.string :type
      t.text :description
      t.integer :construction_year
      t.integer :area
      t.integer :nb_piece
      t.integer :price_rent

      t.timestamps
    end
  end
end
