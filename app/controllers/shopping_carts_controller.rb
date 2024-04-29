
class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_shopping_cart, only: [:show]
  def show
    @cart_products = current_user.cart.shopping_cart_items.includes(:product)
  end

  private

  def ensure_shopping_cart
    current_user.create_cart unless current_user.cart
  end


  def update_quantity
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i
    current_user.update_cart(product, quantity)
    redirect_to cart_path, notice: "Quantity updated successfully."
  end

  def remove
    product = Product.find(params[:product_id])
    current_user.remove_from_cart(product)
    redirect_to cart_path, notice: "Product removed from cart."
  end
end

