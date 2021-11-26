# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'uri'
require 'nokogiri'

def scrape_zal(brand)
  url = "https://www.etsy.com/search?q=#{brand.brand_name}"
  p url
  response = URI.parse(url).open.read
  html_doc = Nokogiri::HTML(response)
  html_doc.search('.v2-listing-card').first(12).each do |element|
    zal_image = element.search('.wt-width-full').attr('src').text.strip
    zal_url = element.search('.listing-link').attr('href').text.strip
    zal_name = element.search('.v2-listing-card__title').text.strip
    zal_price = element.search('.currency-value').text.strip
    product = Product.create(product_name: zal_name, product_price: zal_price, brand: brand, image_url: zal_image, site_url: zal_url )
    p product
  end
end

Product.destroy_all
Following.destroy_all
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

# BrandScraper
burl = "https://yougov.co.uk/ratings/consumer/popularity/fashion-clothing-brands/all"
response = URI.parse(burl).open.read
html_doc = Nokogiri::HTML(response)
html_doc.search('.ng-star-inserted').each do |element|
  image = element.search('img')
  next unless image.attr('alt')
  brand = Brand.new(
    brand_image: image.attr('src').value,
    brand_name: image.attr('alt').value,
    description: Faker::Company.type,
    origin: Faker::Address.country,
    carbon_footprint: Faker::Commerce.price,
    ethics: Faker::Company.buzzword,
    material_resources: Faker::Address.country,
    user: users.sample
  )
  if !Brand.find_by(brand_name: image.attr('alt').value)
    brand.save!
    scrape_zal(brand)
  end
    p brand
end
