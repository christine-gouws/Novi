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
# burl = "https://yougov.co.uk/ratings/consumer/popularity/fashion-clothing-brands/all"
# response = URI.parse(burl).open.read
# html_doc = Nokogiri::HTML(response)
# html_doc.search('.ng-star-inserted').each do |element|
#   image = element.search('img')
#   next unless image.attr('alt')
brand_1 = Brand.create!(
  brand_image: "patagonia.jpg",
  brand_name: "Patagonia",
  description: "Fair trade outdoor clothing",
  origin: "California, USA",
  carbon_footprint: "Works with US factories in Texas and North Carolina and fair trade factories worldwide.",
  ethics: "Certified B Corp, Fair Trade Certified, organic cotton & recycled materials, gives back,
  environmental sustainability initiatives, secondhand shop",
  material_resources: "Recycled materials, organic cotton.",
  user: users.sample
  )

scrape_zal(brand_1)

brand_2 = Brand.create!(
  brand_image: "sezane.jpg",
  brand_name: "Sezane",
  description: "Sustainable production that benefits people and the planet.",
  origin: "Paris, France",
  carbon_footprint: "The brand started online as a way to cut out the middleman, focusing on zero waste production as much as possible.",
  ethics: "Fair labor standards, natural & sustainable materials, gives back, recycled packaging, powered by renewable energy.
  In 2017, Sézane created a philanthropic initiative, DEMAIN, to help children access education and equal opportunities.",
  material_resources: "Natural & sustainable materials.",
  user: users.sample
  )

scrape_zal(brand_2)

brand_3 = Brand.create!(
  brand_image: "reformation.jpg",
  brand_name: "Reformation",
  description: "On-trend eco-friendly clothing.",
  origin: "California, USA",
  carbon_footprint: "Sustainable & regenerative fabrics, carbon- & water-neutral. Reformation is already a climate-neutral brand.",
  ethics: "Made in the USA, safe & fair working conditions, living wages.",
  material_resources: "Reformation’s dedication to sustainable production is extensively explained on its website
  in its signature bold and unabashed style. Plus, each item comes with a description of its environmental footprint.",
  user: users.sample
  )

scrape_zal(brand_3)

brand_4 = Brand.create!(
  brand_image: "levis.jpg",
  brand_name: "Levis",
  description: "THE face of denim.",
  origin: "California, USA",
  carbon_footprint: "Sustainable & regenerative fabrics, carbon- & water-neutral.",
  ethics: "Ethical production & sourcing, sustainable practices & materials, gives back, inclusive sizing, secondhand shop.",
  material_resources: "The brand touts eco-friendly and sustainable practices like recyclable denim, ethically sourced cotton, and innovations to reduce water use.",
  user: users.sample
  )

scrape_zal(brand_4)

brand_5 = Brand.create!(
  brand_image: "faithfull.png",
  brand_name: "Faithfull The Brand",
  description: "Hand made by well-supported local artisans.",
  origin: "Bali, Indonesia",
  carbon_footprint: "Everything is made and resourced locally.",
  ethics: "Made by local artisans who they aim to have a 'mutually beneficial' relationship with.
'It is important to us that we know how our products are made and who is making them,' the brand states.
 'We want to keep a personal connection with each and every one of our employees to ensure they are well taken-care of.'",
  material_resources: "Everything is made and resourced locally.",
  user: users.sample
  )

scrape_zal(brand_5)

brand_6 = Brand.create!(
  brand_image: "mardi.jpg",
  brand_name: "Mardi Edition",
  description: "High and natural quality.",
  origin: "Brussels, Belgium",
  carbon_footprint: "Works only in Europe with small scale factories in Portugal. Assembling is made in Belgium.",
  ethics: "Just and honest prices, transparent work process.",
  material_resources: "Textile with natural fibres, and using leftover fabric from factories.",
  user: users.sample
  )

scrape_zal(brand_6)

brand_7 = Brand.create!(
  brand_image: "people.jpg",
  brand_name: "People Tree",
  description: "Fair trade and affordable fashion.",
  origin: "London, UK",
  carbon_footprint: "Fair Trade Certified pieces, PETA-approved vegan, low impact dyes.",
  ethics: "For over 20 years, the brand has partnered with fair trade artisans and farmers to produce ethical and eco-wear.",
  material_resources: "Organic & biodegradable materials.",
  user: users.sample
  )

scrape_zal(brand_7)

brand_8 = Brand.create!(
  brand_image: "redone.png",
  brand_name: "Re/Done",
  description: "Repurposing old Levis",
  origin: "La, California",
  carbon_footprint: "The brand repurposes old Levis jeans into unique and modern styles.",
  ethics: "",
  material_resources: "Most recently they have just launched their first trainer collection, using a combination of
  recycled leather and a material made from discarded bottles, and not forgetting the organic cotton laces,
  zinc-free eyelets, and soles made up of a recycled rubber compound made from production waste.",
  user: users.sample
  )

scrape_zal(brand_8)

brand_9 = Brand.create!(
  brand_image: "alohas.jpg",
  brand_name: "Alohas",
  description: "Shoes with natural resources",
  origin: "La, California",
  carbon_footprint: "On-demand style shopping platform, on which users an pre-order in advance of products going into
  production, meaning no risk of oversupply and unforgivable waste.",
  ethics: "",
  material_resources: "The brand's 2nd Life project has seen them explore the scope for sustainable vegan materials
  (many other brands use plastic in place of leather, which mostly isn't recyclable). Alohas have begun working with two
  plant-based leather alternatives for their footwear, formed of cactus and corn. In addition, they're producing swimwear
   made with Econyl (recycled nylon from fishing nets, recovered from the sea by volunteer divers).",
  user: users.sample
  )

scrape_zal(brand_9)

brand_10 = Brand.create!(
  brand_image: "veja.jpg",
  brand_name: "Veja",
  description: "Shoes with natural resources",
  origin: "Brazil",
  carbon_footprint: "Veja produce environmentally friendly sneakers made with raw materials sourced from organic farming
  and ecological agriculture, without chemicals or polluting processes.",
  ethics: "",
  material_resources: "'For example, VEJA use organic, agroecological and fair-trade cotton to make the sneakers canvas,
  rubber grown in the Amazon rainforest for the soles and recycled plastic bottles to create a mesh.'",
  user: users.sample
  )

scrape_zal(brand_10)
