# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.all
puts 'Creating flats_markers...'
Flat.new({
  name: "Le Dindon en Laisse",
  address: "Paris, France",
  description: "I love potatoes",
  price_per_night: 5,
  number_of_guests: 2,
  user: users.sample
}).geo_save
Flat.new({
  name: "Neuf et Voisins",
  address: "Brussels, Belgium",
  description: "I love potatoes",
  price_per_night: 5,
  number_of_guests: 2,
  user: users.sample
}).geo_save

Flat.new({
  name: "Neuf et Voisins",
  address: "Brussels, Belgium",
  description: "I love potatoes",
  price_per_night: 5,
  number_of_guests: 2,
  user: users.sample
}).geo_save
Flat.new({
  name: "Neuf et Voisins",
  address: "Brussels, Belgium",
  description: "I love potatoes",
  price_per_night: 5,
  number_of_guests: 2,
  user: users.sample

}).geo_save
Flat.new({
  name: "Neuf et Voisins",
  address: "Brussels, Belgium",
  description: "I love potatoes",
  price_per_night: 5,
  number_of_guests: 2,
  user: users.sample

}).geo_save
Flat.new({
  name: "Neuf et Voisins",
  address: "Brussels, Belgium",
  description: "I love potatoes",
  price_per_night: 5,
  number_of_guests: 2,
  user: users.sample

}).geo_save
puts 'Finished!'
