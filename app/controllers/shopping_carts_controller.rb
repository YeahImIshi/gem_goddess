# app/controllers/shopping_carts_controller.rb
class ShoppingCartsController < ApplicationController
  def show
    @cart_products = Product.where(id: session[:cart])
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
