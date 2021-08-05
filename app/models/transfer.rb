class Transfer < ApplicationRecord
  belongs_to :from_warehouse, class_name: 'Warehouse'
  belongs_to :to_warehouse, class_name: 'Warehouse'
  belongs_to :product

  validates :from_warehouse, presence: true
  validates :to_warehouse, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
  # validates_uniqueness_of :from_warehouse, scope: :to_warehouse
  # validates_uniqueness_of :to_warehouse, scope: :from_warehouse
end
