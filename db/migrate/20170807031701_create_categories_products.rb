class CreateCategoriesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :join_categories_products do |t|
      t.integer :category_id
      t.integer :product_id
    end

    add_index :join_categories_products, [:category_id, :product_id]
  end
end
