class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
    @products = @category.products
  end
end