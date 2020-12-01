class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients 
    has_many :likes 
    has_many :users, through: :likes 
    # belongs_to :creator, class_name: "User"

    belongs_to :creator, class_name: "User", foreign_key: "user_id"


end

