class User < ApplicationRecord
  has_many :shopping_cart_items
  has_one :cart, class_name: 'ShoppingCart'

  after_create :create_cart_if_missing

  def create_cart_if_missing
    create_cart unless cart
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, presence: true
         validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def admin?
    role == 'admin'
  end
end
