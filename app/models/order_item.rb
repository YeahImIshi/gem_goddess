class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
