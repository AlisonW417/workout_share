module ApplicationHelper
    def display_nav_links 
        if logged_in?
            render partial: 'layouts/logged_in_links'
        else
            render partial: 'layouts/logged_out_links'
        end
    end
end
