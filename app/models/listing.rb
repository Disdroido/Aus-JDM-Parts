class Listing < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many_attached :images

    validates :name, :description, :retail_price, :category_id, :brand, :status, presence: true

    def to_s
        name
    end

    after_create do
        listing = Stripe::Product.create(name: name)
        price = Stripe::Price.create(product: listing, unit_amount: retail_price, currency: "aud")
        update(strip_product_id: listing.id, stripe_price_id: price.id)
    end
end
