class Product < ApplicationRecord
  belongs_to :category
  has_many :shopping_cart_items
  has_one_attached :image

  validates :title, :price, :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def self.search(keyword, category_id)
    products = Product.all
    products = products.where('title LIKE ? OR description LIKE ?', "%#{keyword}%", "%#{keyword}%") if keyword.present?
    products = products.where(category_id: category_id) if category_id.present?
    products
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "shopping_cart_items"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category", "category_id", "created_at", "description", "id", "id_value", "image_url", "price", "product_id", "tags", "title", "updated_at", "item_id", "cart_id", "product_id", "quantity"]
  end

end
