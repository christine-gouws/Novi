# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Brand.create!(
  brand_name: "freitag",
  description: 'noice',
  origin: "no idea",
  carbon_footprint: "small",
  ethics: "no small childeren",
  material_resources: "old",
  user_id: 4
)

Brand.create!(
  brand_name: "vans",
  description: 'noice',
  origin: "no idea",
  carbon_footprint: "small",
  ethics: "a lot of small childeren",
  material_resources: "old",
  user_id: 4
)
