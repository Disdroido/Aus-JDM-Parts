class AddStripeProductIdToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :strip_product_id, :string
  end
end
