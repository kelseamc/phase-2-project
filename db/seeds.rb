# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'
require 'faker'

Recipe.destroy_all
User.destroy_all
Ingredient.destroy_all
RecipeIngredient.destroy_all

20.times do
User.create(name: Faker::Name.name, age: Faker::Number.within(range: 21..100), password_digest: Faker::Alphanumeric.alphanumeric(number: 10))
end

20.times do 
    Ingredient.create(name: Faker::Food.ingredient)
end

api_resp_cocktail = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail")
api_data_cocktail = JSON.parse(api_resp_cocktail)

api_data_cocktail["drinks"].each { |drink| Recipe.create(user_id: User.all.sample.id, title: drink["strDrink"], image: drink["strDrinkThumb"], api_id: drink["idDrink"] )}

50.times do 
    RecipeIngredient.create(ingredient_id: Ingredient.all.sample.id, recipe_id: Recipe.all.sample.id, measurement: Faker::Food.measurement)
end

# Recipe.all.each do |recipe|
#     api_resp_recipe = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=#{recipe.api_id}")
#     api_data_recipe = JSON.parse(api_resp_recipe)
#     api_data_recipe["drinks"].each {|drink| RecipeIngredient.create}
#     binding.pry
# end

