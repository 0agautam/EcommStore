class Product < ApplicationRecord
  has_and_belongs_to_many :carts
  belongs_to :category
  has_many :pictures, as: :imageable
end
