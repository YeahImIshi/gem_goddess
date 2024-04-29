class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_item

  validates :user_id, presence: true
end
