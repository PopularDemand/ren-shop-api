puts 'destroying products'
Product.delete_all
puts 'destroying categories'
Category.delete_all
puts "Remaining joins #{CategoriesProduct.count}"
puts "Remaining variations: #{Variation.count}"

def create(clss, &before)
  Proc.new do |obj|
    params = yield obj
    clss.create(params)
  end
end

create_category = create(Category) { |c| c }
create_product = create(Product) do |product|
  product[:categories] = product[:categories].map { |c| Category.find_by(name: c) }
  product
end

puts 'creating categories'
categories = [
  { name: 'Most Popular' },
  { name: 'Apparel' },
  { name: 'Accessories' },
  { name: 'Household' },
  { name: 'Gifts' }
]
categories = categories.map(&create_category)

puts 'creating products'
products = [
  {
    name: 'Ren shirt',
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/shiuniren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 1600,
    categories: ['Most Popular', 'Apparel', 'Gifts']
  }, {
    name: "Ren shirt, women's fitted",
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/shiwomren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 1600,
    categories: ['Most Popular', 'Apparel', 'Gifts']
  }, {
    name: 'Bottle opener',
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/openerren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 600,
    categories: ['Most Popular', 'Household', 'Gifts']
  }, {
    name: "5'x8' notebook",
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/notewhiren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 2800,
    categories: ['Most Popular', 'Accessories', 'Gifts']
  }, {
    name: "3'x6' notebook",
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/noteblaren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 2400,
    categories: ['Most Popular', 'Accessories', 'Gifts']
  }, {
    name: 'Magnet',
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/magren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 400,
    categories: ['Most Popular', 'Household', 'Gifts']
  }, {
    name: '8GB flash drive',
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/flablaren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 1500,
    categories: ['Most Popular', 'Accessories', 'Gifts']
  }, {
    name: '4GB flash drive',
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/flawhiren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 1200,
    categories: ['Most Popular', 'Accessories', 'Gifts']
  }, {
    name: 'Drink tumbler',
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/botwhiren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 1200,
    categories: ['Most Popular', 'Household', 'Gifts']
  }, {
    name: 'Water bottle, standard',
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/botgraren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 800,
    categories: ['Most Popular', 'Accessories', 'Household', 'Gifts']
  }, {
    name: 'Metal water bottle',
    image: 'https://s3-us-west-2.amazonaws.com/ren-forge/products/botblaren-min.jpg',
    description: 'Generic product description. Comes in small, medium, and large sizes',
    price: 1200,
    categories: ['Most Popular', 'Household', 'Accessories', 'Gifts']
  }
]
products = products.map(&create_product)