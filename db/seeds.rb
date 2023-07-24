# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
admin_user = User.create!(
  name: "Admin",
  email: "admin@example.com",
  password: "password",
  role: :admin
)

# Crea una nueva imagen para el usuario administrador
admin_image = Image.create!(
  url: "https://s1.eestatic.com/2020/05/18/como/gatos-mascotas-trucos_490961518_152142875_1706x960.jpg",
  imageable_type: "User",
  imageable_id: admin_user.id
)

puts "Admin user created successfully with profile image."