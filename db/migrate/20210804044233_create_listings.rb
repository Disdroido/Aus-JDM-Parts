class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.float :retail_price
      t.string :vehicle_make
      t.string :vehicle_model

      t.timestamps
    end
  end
end
