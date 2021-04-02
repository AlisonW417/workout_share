class UsersController < ApplicationController
    skip_before_action :redirect_if_not_logged_in, only: [:new]
    
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            render :new 
        end 
    end 

    def show 
        @user = User.find_by(id: params[:id])
        @workouts = @user.workouts
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :password)
    end 
end
