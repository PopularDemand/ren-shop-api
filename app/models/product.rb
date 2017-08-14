class Product < ApplicationRecord
  has_many :categories_products,
           dependent: :destroy
  has_many :categories,
           through: :categories_products
  has_many :variations,
           dependent: :destroy
end