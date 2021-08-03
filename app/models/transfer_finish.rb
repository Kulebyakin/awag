class TransferFinish
  include ActiveModel::Model
  attr_accessor :amount, :product_id
  validates :amount, presence: true
end