# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the database..."
Restaurant.destroy_all

puts "Creating restaurants"

10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    category: %w(chinese italian japanese french belgian).sample
  )
  puts "Created restaurant #{restaurant.name}"

  2.times do
    review = Review.create(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
  end
  puts "Created 2 reviews for restaurant #{restaurant.name}"
end
