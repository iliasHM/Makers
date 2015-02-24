# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


category_array = ["découpe laser", "découpe vinyle", "découpe plasma", "traceur de plan"]
colors_string = "bleu, blanc, jaune, noir"

User.destroy_all
users = 2.times.map do
  user = User.new({
    name: Faker::Name.name,
    password: "12345678",
    password_confirmation: "12345678",
    email: Faker::Internet.free_email,
    })
  user.save!

  user
end

Brand.destroy_all
brands = 2.times.map do
  brand = Brand.new({
    name: Faker::Company.name,
    })
  brand.save!

  brand
end

Category.destroy_all
categories = 2.times.map do
  category = Category.new({
    name: category_array.sample,
    })
  category.save!

  category
end

MachineModel.destroy_all
machine_models = 2.times.map do
  machine_model = MachineModel.new({
    name: Faker::Commerce.product_name,
    category: categories.sample,
    brand: brands.sample,
    })
  machine_model.save!

  machine_model
end

Material.destroy_all
materials = 2.times.map do
  material = Material.new({
    name: Faker::Commerce.product_name,

  })
  material.save

  material
end

Machine.destroy_all
machines = 2.times.map do
  machine = Machine.new({
    length: Faker::Number.number(2),
    width: Faker::Number.number(2),
    description: Faker::Lorem.paragraph,
    maker: users.sample,
    machine_model: machine_models.sample,
    })
  machine.machine_materials.build(material: materials.sample, colors: colors_string )
  machine.save!
  machine
end






