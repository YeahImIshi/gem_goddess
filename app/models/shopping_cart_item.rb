class ShoppingCartItem < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :shopping_cart

  def self.ransackable_attributes(auth_object = nil)
    ["cart_id", "created_at", "id", "id_value", "item_id", "product_id", "quantity", "updated_at"]
  end
end
