# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#     User.create(
#         name: Faker::Name.name,
#         email: Faker::Internet.email,
#         password: '12345678',
#         password_confirmation: '12345678'
#     )
#   end
  
  20.times do |index|
    Exhibition.create(
        user: User.offset(rand(User.count)).first,
        title: "個展#{index}",
        description: "個展の紹介だよ#{index}"
    )
  end
  p "OK"