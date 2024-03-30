class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.integer :image_id
      t.integer :product_id
      t.string :image_url

      t.timestamps
    end
  end
end
