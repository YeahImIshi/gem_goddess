class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if params[:category].present?
      @category = Category.find(params[:category])
      @products = @category.products
    else
      @products = Product.includes(:category).all
    end

    @product = Product.find(params[:id])
  end
  def category
    @category = Category.find(params[:category_id])
    @products = @category.products
  end

  def search
    @keyword = params[:keyword]
    @category_id = params[:category]
    @products = Product.search(@keyword, @category_id).paginate(page: params[:page], per_page: 10)
  end

  def add_to_cart
    product = Product.find(params[:id])
    session[:cart] ||= []
    session[:cart] << product.id
    redirect_to products_path, notice: "#{product.title} added to cart."
  end
end