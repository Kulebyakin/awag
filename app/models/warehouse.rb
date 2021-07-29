class Warehouse < ApplicationRecord
  has_many :deliveries
  has_many :products, through: :deliveries

  validates :title, presence: true, uniqueness: true
  validates :region, presence: true
end
