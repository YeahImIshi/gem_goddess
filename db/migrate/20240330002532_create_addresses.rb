class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.integer :address_id
      t.integer :user_id
      t.string :address
      t.string :province

      t.timestamps
    end
  end
end
