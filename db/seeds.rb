require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join("db/products.csv")
csv_data = File.read(csv_file, encoding: "bom|utf-8")

products = CSV.parse(csv_data, headers: true)

products.each do |row|
  category = Category.find_or_create_by(name: row["category"])

  category.products.create!(
    title: row["name"],
    description: row["description"],
    price: row["price"],
    stock_quantity: row["stock quantity"]
  )
end

puts "Created #{Category.count} categories and #{Product.count} products"