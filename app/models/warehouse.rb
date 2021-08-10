class Warehouse < ApplicationRecord
  has_many :product_warehouses
  has_many :deliveries
  has_many :products, through: :product_warehouse
  has_many :from_transfers, class_name: 'Transfer', inverse_of: :from_warehouse
  has_many :to_transfers, class_name: 'Transfer', inverse_of: :to_warehouse
  has_many :products, through: :transfers

  validates :title, presence: true, uniqueness: true
  validates :region, presence: true

  enum region: {
    "Центральный": 0,
    "Северо-западный": 1,
    "Приволжский": 2,
    "Южный": 3,
    "Северо-кавказский": 4,
    "Уральский": 5,
    "Сибирский": 6,
    "Дальневосточный": 7
  }

end
