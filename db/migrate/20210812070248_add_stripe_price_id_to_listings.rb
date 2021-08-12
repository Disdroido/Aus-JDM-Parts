class AddStripePriceIdToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :stripe_price_id, :string
  end
end
