class CreateShoppingCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_cart_items do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
