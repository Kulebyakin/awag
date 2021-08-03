class TransferStart
  include ActiveModel::Model
  attr_accessor :from_warehouse, :to_warehouse
  validates :from_warehouse, presence: true
  validates :to_warehouse, presence: true
end