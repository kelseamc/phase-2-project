class LikesController < ApplicationController

    def create
        # @user = User.find(cookies[:user_id])
        @recipe = Recipe.find(params[:recipe_id])
        @new_like = Like.create(user_id: @current_user.id, recipe_id: @recipe.id)
        redirect_to recipe_path(@recipe.id)
    end

end
