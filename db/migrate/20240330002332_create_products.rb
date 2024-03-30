class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :title
      t.decimal :price
      t.text :description
      t.string :category
      t.string :tags
      t.string :image_url

      t.timestamps
    end
  end
end
