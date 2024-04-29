class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_items, foreign_key: 'cart_id', dependent: :destroy



  validates :user_id, presence: true
end
