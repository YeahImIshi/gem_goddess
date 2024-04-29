class ShoppingCartItem < ApplicationRecord
  belongs_to :user
  belongs_to :cart, class_name: 'ShoppingCart', foreign_key: 'cart_id'
  belongs_to :product

  validates :cart, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["cart_id", "created_at", "id", "id_value", "item_id", "product_id", "quantity", "updated_at"]
  end
end
