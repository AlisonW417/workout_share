class CommentsController < ApplicationController
    def new 
        if nested?
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
        if nested?
            @comments = @workout.comments.order_by_create 
        else 
            @comments = Comment.order_by_create
        end 
    end 
   
    private 
    def comment_params 
        params.require(:comment).permit(:description, :workout_id)
    end 

    def nested? 
        @workout = Workout.find_by(id: params[:workout_id])
    end 
end
