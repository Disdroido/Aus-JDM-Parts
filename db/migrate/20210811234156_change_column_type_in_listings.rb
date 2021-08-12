class ChangeColumnTypeInListings < ActiveRecord::Migration[6.1]
  def change
    change_table :listings do |t|
      t.change :retail_price, :integer
    end
  end
end
