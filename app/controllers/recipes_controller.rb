class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all 
    end


    def show 
        @recipe = Recipe.find(params[:id])
        
        # @new_like = Like.create(user_id: @like[:user_id], recipe_id: @like[:recipe_id])
    end 

    def new 
        @recipe = Recipe.new 
    end 

    def create
        @recipe = Recipe.create(recipe_params)
    end


    def destroy 
        @recipe = Recipe.find(params[:id])
        @recipe.destroy 

        redirect_to recipes_path
    end 

      
  def update 
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    
    redirect_to recipe_path(@recipe)
  end 
  
  

    private

    def recipe_params
        params.require(:recipe).permit(:title, :user_id, :image, :api_id, ingredient_attributes: [:id, :name])
    end

 end
