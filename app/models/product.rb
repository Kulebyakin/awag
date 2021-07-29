class Product < ApplicationRecord
  validations :title, presence: true, uniqueness: true
end
