class Warehouse < ApplicationRecord
  has_many :deliveries
  has_many :products, through: :deliveries

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
