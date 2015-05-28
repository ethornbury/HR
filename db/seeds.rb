# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#the code below is used with the gem'faker' to create sample users
#require 'faker'
Employee.create!(firstname:  "Emer",
             lastname: "Admin",
             email: "example@et.ie",
             admin: true,
             jobType: "Admin")
             
Employee.create!(firstname:  "John",
             lastname: "Doe",
             email: "example1@et.ie",
             jobType: "Sales")

Employee.create!(firstname:  "Mary",
             lastname: "Cullen",
             email: "example2@et.ie",
             jobType: "Sales")
             
Employee.create!(firstname:  "Mark",
             lastname: "Smith",
             email: "example3@et.ie",
             jobType: "Sales")

Employee.create!(firstname:  "Anne",
             lastname: "McCarthy",
             email: "example4@et.ie",
             jobType: "Sales")
             
User.create!(firstname:  "Tim",
             lastname: "Burn",
             email: "example5@et.ie",
             jobType: "Sales")

50.times do |n|
  firstname  = Faker::Name.name
  lastname   = Faker::Name.name
  email = "example-#{n+1}@et.ie"
  Employee.create!(name: firstname,
    name: lastname,
    email: email)
end

10.times do |n|
  email = "example-#{n+1}@et.ie"
  password = "password"
  User.create!(email: email,
               password:              password,
               password_confirmation: password)
end
