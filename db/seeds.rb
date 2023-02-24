# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Beer.delete_all
Company.delete_all

5.times do
  company = Company.create(name: Faker::Company.unique.name)

  number_of_beers = rand(4..8)

  number_of_beers.times do
    company.beers.create(
      name: Faker::Beer.unique.name,
      price: Faker::Commerce.price,
      description: "This #{Faker::Beer.style} style has #{Faker::Beer.alcohol} alcohol and was brewed
      with # #{Faker::Beer.malts}, #{Faker::Beer.yeast} yeast and a twist of #{Faker::Beer.hop} hops..."
    )
  end
end
puts "Created #{Company.count} Companies"
puts "Created #{Beer.count} Beers"