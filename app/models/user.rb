class User < ApplicationRecord
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
