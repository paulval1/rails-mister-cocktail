# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "whisky")
# Ingredient.create(name: "gin")
# Ingredient.create(name: "vodka")
Ingredient.destroy_all

require 'json'
require 'open-uri'
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
flats = JSON.parse(open(url).read)
  #flats is an array of objects (hashes)
  arr = flats["drinks"]
  arr.each do |v|
    Ingredient.create(name: v["strIngredient1"])
  end
