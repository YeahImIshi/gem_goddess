class Order < ApplicationRecord
  belongs_to :user

  validates :total_price, presence: true
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
end
end
