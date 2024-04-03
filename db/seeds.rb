# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Create categories
categories = ['Rings', 'Bracelets', 'Necklaces', 'Earrings']

categories.each do |category_title|
  Category.create(title: category_title)
end

# Generate products
categories.each do |category_title|
  category = Category.find_by(title: category_title)
  100.times do
    Product.create(
      title: Faker::Commerce.product_name,
      price: Faker::Commerce.price(range: 10.0..500.0),
      description: Faker::Lorem.sentence,
      category: category,
      tags: Faker::Lorem.words(number: 3).join(", "),
      image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['jewelry', 'fashion'])
    )
  end
end
