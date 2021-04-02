class CommentsController < ApplicationController
    def new 
        if @workout = Workout.find_by_id(params[:workout_id])
            @comment = @workout.comments.build
        else 
            @comment = Comment.new 
        end 
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
            @comments = @workout.comments.order_by_create 
        else 
            @comments = Comment.order_by_create
        end 
    end 
   
    def comment_params 
        params.require(:comment).permit(:description, :workout_id)
    end 
end
