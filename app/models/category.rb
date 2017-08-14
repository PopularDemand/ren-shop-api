class Category < ApplicationRecord
  has_many :categories_products,
           dependent: :destroy
  has_many :products,
           through: :categories_products
end
