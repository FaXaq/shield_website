# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(title: 'Events', description: 'Events, Tournaments, etc.')
Category.create(title: 'Presentation', description: 'Presentation posts')

User.create(name: "admin", email: "default@admin.com", firstname: "Aria", lastname: "Stark", admin: 1, password: "password", password_confirmation: "password")
