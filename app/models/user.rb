class User < ApplicationRecord
    has_many :likes
    has_many :recipes, through: :likes 
    has_many :created_recipes, foreign_key: "user_id", class_name: "Recipe"

    has_secure_password 

    validates :age, numericality: {greater_than_or_equal_to: 21}

    # validates_numericality_of :stock_qty, :greater_than_or_equal_to => 0
    
end
