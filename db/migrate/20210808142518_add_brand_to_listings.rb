class AddBrandToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :brand, :string
  end
end
