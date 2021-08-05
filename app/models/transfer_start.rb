class TransferStart
  extend ActiveModel::Naming
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :from_warehouse, :to_warehouse
  validates :from_warehouse, presence: true
  validates :to_warehouse, presence: true
  # validates :from_warehouse, uniqueness: { scope: :to_warehouse }
  # validates :to_warehouse, uniqueness: { scope: :from_warehouse }
  # validates_uniqueness_of :from_warehouse, scope: :to_warehouse
  # validates_uniqueness_of :to_warehouse, scope: :from_warehouse
  validate :to_warehouses_and_from_warehouse_must_be_different

  def to_warehouses_and_from_warehouse_must_be_different
    if :from_warehouse == :to_warehouse
      errors.add(:transfer_start, "Выбирите разные склады")
    end
  end
end