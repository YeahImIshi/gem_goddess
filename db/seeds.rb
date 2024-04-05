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
require 'csv'

# Generate random products using Faker
10.times do
  Product.create(
    title: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10.0..500.0),
    description: Faker::Lorem.sentence,
    tags: Faker::Lorem.words(number: 3).join(", "),
    image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['jewelry', 'fashion'])
  )
end

# Import products from CSV
CSV.foreach(Rails.root.join('db', 'jewelry.csv'), headers: true) do |row|
  product_params = row.to_h
  category_title = product_params.delete('category')

  # Find or create the category
  category = Category.find_or_create_by(title: category_title)

  # Create the product with the associated category
  Product.create(
    product_id: product_params['product_id'],
    title: product_params['title'],
    price: product_params['price'].to_f,
    tags: product_params['tags'],
    description: product_params['description'],
    image_url: product_params['image_url'],
    category: category
  )
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?