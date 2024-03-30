class CreateTaxRates < ActiveRecord::Migration[7.1]
  def change
    create_table :tax_rates do |t|
      t.string :province
      t.decimal :tax_rate

      t.timestamps
    end
  end
end
