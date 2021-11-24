# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Rating.destroy_all
Like.destroy_all
Post.destroy_all
Brand.destroy_all
User.destroy_all

tina = User.create!(first_name: "tina", last_name: "gouws", password: "123123", email: "tina@gmail.com")
file = File.open((Rails.root.join('app', 'assets', 'images', 'tina.jpg')))
tina.photo.attach(io: file, filename: 'tina.jpg', content_type: 'image/jpg')
p tina
hans = User.create!(first_name: "hans", last_name: "tys", password: "123123", email: "hans@gmail.com")
file = File.open((Rails.root.join('app', 'assets', 'images', 'hans.jpg')))
hans.photo.attach(io: file, filename: 'hans.jpg', content_type: 'image/jpg')
p hans
layla = User.create!(first_name: "layla", last_name: "idk", password: "123123", email: "layla@gmail.com")
file = File.open((Rails.root.join('app', 'assets', 'images', 'layla.jpg')))
layla.photo.attach(io: file, filename: 'layla.jpg', content_type: 'image/jpg')
p layla
users = [tina, layla, hans]
100.times do
  brand = Brand.new(
    brand_name: Faker::Commerce.brand,
    description: Faker::Company.type,
    origin: Faker::Address.country,
    carbon_footprint: Faker::Commerce.price,
    ethics: Faker::Company.buzzword,
    material_resources: Faker::Address.country,
    user: users.sample
  )
  brand.save!
  p brand
end

