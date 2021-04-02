class SessionsController < ApplicationController
    def welcome 
    end 

    def new 
    end 

    def create 
        #raise params.inspect
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user) 
        else 
            flash[:error] = "Log in information was incorrect. Please try again."
            redirect_to login_path
        end 
    end 

    def omniauth 
        #byebug
        user = User.create_from_omniauth(auth)
        if user.valid? 
            session[:user_id] = user.id 
            redirect_to user_path(user)
        else 
            redirect_to welcome_path
        end 
    end 

    def destroy 
        session.delete(:user_id)
        redirect_to '/'
    end 

    private 
    def auth 
        request.env['omniauth.auth']
    end 
end