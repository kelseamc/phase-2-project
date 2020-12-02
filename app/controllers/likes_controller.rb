class LikesController < ApplicationController

    def new
        @like = Like.new 
    end

    def create
        @new_like = Like.create(user_id: @like[:user_id], recipe_id: @like[:recipe_id])
    end





end
