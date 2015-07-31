# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require 'faker'
Employee.create!(firstname:  "Admin",
             lastname: "User",
             email: "admin@email.com",
             admin: true,
             jobType: "Admin")
             
Employee.create!(firstname:  "John",
             lastname: "Doe",
             email: "example1@email.com",
             jobType: "Sales")

Employee.create!(firstname:  "Mary",
             lastname: "Cullen",
             email: "example2@email.com",
             jobType: "Sales")
             
Employee.create!(firstname:  "Mark",
             lastname: "Smith",
             email: "example3@email.com",
             jobType: "Sales")

Employee.create!(firstname:  "Anne",
             lastname: "McCarthy",
             email: "example4@email.com",
             jobType: "Sales")
             
User.create!(email: "admin@email.com",
             admin: true,
             password:              password,
             password_confirmation: password)

#50.times do |n|
#  firstname  = Faker::Name.name
#  lastname   = Faker::Name.name
#  email = "example-#{n+1}@email.com"
#  Employee.create!(name: firstname,
#    name: lastname,
#    email: email)
#end

5.times do |n|
  email = "example-#{n+1}@email.com"
  password = "password"
  User.create!(email: email,
               password:              password,
               password_confirmation: password)
end
