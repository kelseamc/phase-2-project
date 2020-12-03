class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]


    def index 
        @users = User.all 
    end

    def show 
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end
    
    def create
            user = User.create(user_params)
        
            if user.valid?
              cookies[:user_id] = user.id
              redirect_to users_path
            else
              flash[:errors] = user.errors.full_messages
              redirect_to new_user_path 
            end 
         
    end

    def profile
        if @current_user.valid?
            render :profile 
        else
            redirect_to login_path 
        end
    end


    private 

    def user_params 
        params.require(:user).permit(:name, :age, :password)
    end 

end
