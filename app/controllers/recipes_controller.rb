class RecipesController < ApplicationController

    skip_before_action :authorized, only: [:index]

    def index
        @recipes = Recipe.search(params[:search])
    end


    def show 
        @recipe = Recipe.find(params[:id])
    end 

    def edit 
        @recipe = Recipe.find(params[:id])
        
        if @recipe.user.id == @current_user.id
            render :edit
        else
             redirect_to recipe_path(@recipe) 
             flash[:error] = 'You can only edit your own recipe!'
        end  
      
    end 

    def new 
        @recipe = Recipe.new 
       
        params[:ingredient_count].to_i.times {@recipe.recipe_ingredients.build}
    end 

    def create
        
        @recipe = Recipe.create(recipe_params)
        
        redirect_to recipe_path(@recipe.id)
        
    end


    def destroy 
        @recipe = Recipe.find(params[:id])
        if @recipe.user.id == @current_user.id
            @recipe.destroy 
            redirect_to profile_path(@current_user)
        else
             redirect_to recipe_path(@recipe) 
             flash[:error] = 'You can only delete your own recipe!'
        end 
    end 
    
      
    def update 
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end 
  
  

    private

    def recipe_params
        params.require(:recipe).permit(:title, :user_id, :image, :api_id, recipe_ingredients_attributes: [:ingredient_id, :measurement])
    end

 end
