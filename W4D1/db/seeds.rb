# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
SharedArtwork.destroy_all

user1 = User.create!(username: "Li Hsuan Lu")
user2 = User.create!(username: "Andrew Booth")
user3 = User.create!(username: "Skyfish")
user4 = User.create!(username: "Anastassia Bobokalonova")

artwork1 = Artwork.create(title: "Huwomen Body", image_url: "https://s-media-cache-ak0.pinimg.com/736x/b8/81/3b/b8813bec4a36264ff0c0fc1014d2c03f.jpg", artist_id: user2.id)
artwork2 = Artwork.create(title: "Starry Starry Sky", image_url: "https://lh6.ggpht.com/HlgucZ0ylJAfZgusynnUwxNIgIp5htNhShF559x3dRXiuy_UdP3UQVLYW6c", artist_id: user1.id)
artwork3 = Artwork.create(title: "Huwomen Body", image_url: "http://www.arthistoryarchive.com/arthistory/worldofart/images/IvanBilibin-Tsar-Dadon-stands-before-the-Shemakha-Queen-1906.jpg", artist_id: user4.id)

sharedartwork1 = SharedArtwork.create(artwork_id: artwork1.id, viewer_id: user1.id)
sharedartwork2 = SharedArtwork.create(artwork_id: artwork2.id, viewer_id: user2.id)
sharedartwork3 = SharedArtwork.create(artwork_id: artwork3.id, viewer_id: user3.id)
