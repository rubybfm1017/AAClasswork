# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat = User.create(username: "cat")
dog = User.create(username: "dog")
# User.create(username: "cat")

starry_night = Artwork.create(title: "Starry Night", image_url: "cat.com", artist_id: cat.id)
coffee_shop = Artwork.create(title: "Coffee Shop", image_url: "dog.com", artist_id: dog.id)

ArtworkShare.create(artwork_id: starry_night.id, viewer_id: dog.id)
ArtworkShare.create(artwork_id: coffee_shop.id, viewer_id: cat.id)