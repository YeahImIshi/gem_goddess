class TaxRate < ApplicationRecord
  validates :province, presence: true
  validates :tax_rate, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
