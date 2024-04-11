class Product < ApplicationRecord
  belongs_to :category
  has_many :shopping_cart_items

  validates :title, :price, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def self.search(keyword, category_id)
    products = Product.all
    products = products.where('title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%") if keyword.present?
    products = products.where(category_id: category_id) if category_id.present?
    products
  end
end
