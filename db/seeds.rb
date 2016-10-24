# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Jeff", email: "jeff@example.org", password: "password12", password_confirmation: "password12", admin: true)
User.create(name: "Jake", email: "jake@example.org", password: "password12", password_confirmation: "password12", admin: false)

Routine.create(name: "Phrak's Grey Skill LP", user_id: 1)
Routine.create(name: "Starting Strength", user_id: 1)
Routine.create(name: "Strong Lifts 5x5", user_id: 2)
Routine.create(name: "Ice Cream LP", user_id: 2)
