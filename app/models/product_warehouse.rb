class ProductWarehouse < ApplicationRecord
  belongs_to :warehouse
  belongs_to :product

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
