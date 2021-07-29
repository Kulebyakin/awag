class Warehouse < ApplicationRecord
  validations :title, presence: true, uniqueness: true
  validates :region, presence: true
end
