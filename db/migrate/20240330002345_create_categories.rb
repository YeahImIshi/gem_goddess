class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.integer :category_id
      t.string :title

      t.timestamps
    end
  end
end
