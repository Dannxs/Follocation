class RemoveColumnsRentals < ActiveRecord::Migration[6.1]
  def change
    remove_column :rentals, :address
    remove_column :rentals, :country
    remove_column :rentals, :city
    remove_column :rentals, :postal_code
    remove_column :rentals, :construction_year
  end
end
