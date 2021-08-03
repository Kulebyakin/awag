class Product < ApplicationRecord
  has_many :deliveries, dependent: :destroy
  has_many :warehouses, through: :deliveries
  has_many :transfers, dependent: :destroy
  has_many :warehouses, through: :transfers

  validates :title, presence: true, uniqueness: true
end
