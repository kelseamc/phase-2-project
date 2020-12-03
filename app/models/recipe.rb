class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients 
    has_many :likes 
    has_many :users, through: :likes 
    belongs_to :user
    
    accepts_nested_attributes_for :recipe_ingredients


end

