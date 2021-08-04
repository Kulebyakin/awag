class Transfer < ApplicationRecord
  belongs_to :from_warehouse, class_name: 'Warehouse'
  belongs_to :to_warehouse, class_name: 'Warehouse'
  belongs_to :product

  accepts_nested_attributes_for :from_warehouse, :to_warehouse

  validates :from_warehouse, presence: true
  validates :to_warehouse, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
