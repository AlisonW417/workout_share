class CommentsController < ApplicationController
    def new 
    end 

    def create 
        raise params.inspect
        @comment = current_user.comments.build(comment_params)
        if @comment.save 
            redirect_to welcome_path 
        end
    end 

    def comment_params 
        params.require(:comment).permit(:description)
    end 
end
