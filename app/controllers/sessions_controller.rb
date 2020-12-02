class SessionsController < ApplicationController

    # def reset_view_count
    #     # cookies[:view_count] = nil
    #     cookies.delete(:view_count)
        
    #     redirect_back fallback_location: planets_path
    #   end 
    
      def logout
        cookies.delete(:user_id)
        redirect_to new_user_path
      end 
    
      def new
      end
    
      def login
        user = User.find_by(name: params[:session][:name])
    
        if user && user.authenticate(params[:session][:password])
          cookies[:user_id] = user.id
          redirect_to users_path
        else
          flash[:errors] = "Username or Password does not match" 
          redirect_to new_login_path
        end 
      end 
    
    end
    