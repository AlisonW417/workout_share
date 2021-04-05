module CommentsHelper
    def display_header(comment)
        if params[:workout_id]
            content_tag(:h1, "Give #{@workout.user.username} kudos on #{@workout.name}")
        else 
            content_tag(:h1, "Create a Comment")
        end 
    end 
end 
