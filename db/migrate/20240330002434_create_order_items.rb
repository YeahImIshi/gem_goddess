class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.integer :order_item_id
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :price_per_unit

      t.timestamps
    end
  end
end
