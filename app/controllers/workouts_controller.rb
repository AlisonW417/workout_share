class WorkoutsController < ApplicationController

    def new 
        @workout = Workout.new
    end 

    def create 
        @workout = Workout.new(workout_params)
        @workout.user_id = session[:user_id]
        if @workout.save 
            redirect_to workout_path(@workout)
        else 
            render :new
        end 
    end 

    def show 
        @workout = Workout.find_by(id: params[:id])
    end 

    def edit 
        @workout = Workout.find_by(id: params[:id])
    end 

    def update 
        @workout = Workout.find_by(id: params[:id])
        if @workout.update(workout_params)
            redirect_to workout_path(@workout)
        else 
            render :edit 
        end 
    end 

    def workout_params 
        params.require(:workout).permit(:name, :date_completed, :duration, :cardio, :strength, :average_heart_rate, :total_calories, :description)
    end 
end
