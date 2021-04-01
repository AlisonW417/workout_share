class CommentsController < ApplicationController
    def new 
        # should a user have the option to create a new comment without starting on workout's show page?
        @workout = Workout.find_by(id: params[:workout_id])
        @comment = @workout.comments.build
    end 

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save 
            redirect_to workout_comments_path(@comment.workout_id) 
        else 
            render :new
        end
    end 

    def index
        if @workout = Workout.find_by(id: params[:workout_id])
            @comments = @workout.comments 
        else 
            @comments = Comment.all 
        end 
    end 
   
    def comment_params 
        params.require(:comment).permit(:description, :workout_id)
    end 
end
