class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if params[:category].present?
      @category = Category.find(params[:category])
      @products = @category.products
    else
      @products = Product.includes(:category).all
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  def category
    @category = Category.find(params[:category_id])
    @products = @category.products
  end
end