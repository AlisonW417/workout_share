class SessionsController < ApplicationController
    def welcome 
    end 

    def new 
    end 

    def create 
        #raise params.inspect
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(password: params[:password])
            session[:user_id] = @user.id 
            redirect_to welcome_path #change to user show page
        else 
            redirect_to login_path
        end 
    end 

    def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end 
end