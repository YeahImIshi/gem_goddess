
class Admin::ProductsController < AdminController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Product created successfully.'
    else
      render :new
    end
  end
  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :stock_quantity)
  end
end
