# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Bid.destroy_all
Car.destroy_all
User.destroy_all

User.create(name: "Teszt Elek", password: "pass", image: "placeholder.jpeg")
User.create(name: "Teszt Elek 2", password: "pass2", image: "placeholder.jpeg")

Car.create(brand: "Ferrari", model: "F40", BHP: 400, mileage: 10000, starting_price: 20000, image: "Ferrari-F40.jpg", user: User.first)
Car.create(brand: "Lamborghini", model: "Gallardo", BHP: 500, mileage: 10000, starting_price: 30000, image: "lamborghini-gallardo.jpg", user: User.last)


Bid.create(user: User.last, car: Car.first, amount: 40000)


