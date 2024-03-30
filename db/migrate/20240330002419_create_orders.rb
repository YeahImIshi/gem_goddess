class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.integer :user_id
      t.decimal :total_price

      t.timestamps
    end
  end
end
