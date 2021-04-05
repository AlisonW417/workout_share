class WorkoutsController < ApplicationController

    def index
        @workouts = Workout.order_by_date
    end 

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
        set_workout
        @comment = @workout.comments.build
    end 

    def edit 
        set_workout
        check_user
    end 

    def update 
        set_workout
        if @workout.update(workout_params)
            redirect_to workout_path(@workout)
        else 
            render :edit 
        end 
    end 

    def destroy
        set_workout
        @workout.destroy
        redirect_to user_path(@workout.user_id)
    end 
    
    private 
    def workout_params 
        params.require(:workout).permit(:name, :date_completed, :duration, :cardio, :strength, :average_heart_rate, :total_calories, :description)
    end 

    def set_workout
        @workout = Workout.find_by(id: params[:id])
    end 

    def check_user 
        redirect_to welcome_path if @workout.user != current_user 
        flash[:message] = "You do not have access to edit this workout."
    end 
end
