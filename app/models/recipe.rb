class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients 
    has_many :likes 
    has_many :users, through: :likes 
    belongs_to :user
    
    accepts_nested_attributes_for :recipe_ingredients

    def self.search(search)
        if search
            ingredient = Ingredient.find_by(name: search)
            if ingredient
               ingredient.recipes
            else
                Recipe.all
            end
        else
            Recipe.all
        end
    end

end

