# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Administrator.create!(
             email: 'admin@example.com',
             password: 'password',
             password_confirmation: 'password',
             admin: true)

category_map = {
	1 => {name: "機上型"},
  2 => {name: "機下型"},
  3 => {name: "風冷"},
  4 => {name: "管冷"}
}

category_map.keys.each do |index|
  category = Category.create!(
      name: category_map[index][:name]
  )
end