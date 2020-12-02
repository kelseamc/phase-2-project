class User < ApplicationRecord
    has_many :likes
    has_many :recipes, through: :likes 
    has_many :created_recipes, foreign_key: "user_id", class_name: "Recipe"

    has_secure_password 


    # def user_name_and_name 
    #     "#{self.name} || #{self.user_name}"
    #   end 

# def password=(user_input)
#     hashed_password = BCrypt::Password.create(user_input)
#     self.password_digest = hashed_password
#   end 

#   def password 
#   end 
    
end
