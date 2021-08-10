class Listing < ApplicationRecord
    belongs_to :user
    belongs_to :category
    
    has_many_attached :images
end
