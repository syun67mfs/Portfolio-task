# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: 'admin@mail', password: 'password')

User.create(
  email: 'shu@shu',
  password: 'syun6481',
  )

Genre.create(name: 'PS4')
Genre.create(name: 'PS5')
Genre.create(name: 'Xbox')
Genre.create(name: 'Switch')
Genre.create(name: 'PC')