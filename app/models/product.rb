class Product < ApplicationRecord
  belongs_to :category

  def self.search(keyword, category_id)
    products = Product.all
    products = products.where('title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%") if keyword.present?
    products = products.where(category_id: category_id) if category_id.present?
    products
  end
end
