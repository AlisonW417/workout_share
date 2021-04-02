class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in 
    before_action :redirect_if_not_logged_in

    private 
    def current_user 
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 

    def logged_in? 
        !!current_user 
    end 

    def redirect_if_not_logged_in 
        flash[:error] = "You must be logged in to view that page."
        redirect_to login_path if !logged_in?
    end 
end
