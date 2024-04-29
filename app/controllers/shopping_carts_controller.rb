
class ShoppingCartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @cart_products = current_user.shopping_cart_items.includes(:product)
  end

  def update
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

