class Product < ApplicationRecord
  has_many :deliveries
  has_many :warehouses, through: :deliveries

  validates :title, presence: true, uniqueness: true
end
