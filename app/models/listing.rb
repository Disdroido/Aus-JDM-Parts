class Listing < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many_attached :images

    validates :name, :description, :retail_price, :category_id, :brand, :status, presence: true
end
