class User < ApplicationRecord
    has_many :likes
    has_many :recipes, through: :likes 
    has_many :created_recipes, foreign_key: "user_id", class_name: "Recipe"
end
