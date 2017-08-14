class CategoriesProduct < ApplicationRecord
  self.table_name = "join_categories_products"

  belongs_to :category
  belongs_to :product
end
