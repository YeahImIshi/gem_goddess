# app/controllers/shopping_carts_controller.rb
class ShoppingCartsController < ApplicationController
  def show
    @cart_products = Product.where(id: session[:cart])
  end
end
