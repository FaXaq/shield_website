# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(title: 'Events', description: 'Events, Tournaments, etc.')
Category.create(title: 'Presentation', description: 'Posts qui apparaissent sur la première page')
Category.create(title: 'Important', description: 'Annonces importantes')

User.create(name: "admin", email: "shield.paris@gmail.com", firstname: "SHiELD", lastname: "Up!", admin: 1, password: "L4T34MSH13LD", password_confirmation: "L4T34MSH13LD")
