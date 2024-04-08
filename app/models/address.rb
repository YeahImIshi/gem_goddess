class Address < ApplicationRecord
  belongs_to :user

  validates :address, :province, presence: true
end
