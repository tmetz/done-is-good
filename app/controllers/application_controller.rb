class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?, :require_login
    before_action :require_login

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

    def require_login
        #return head(:forbidden) unless session.include? :user_id
        if !logged_in?
            flash[:error] = "You must be logged in first."
            redirect_to '/'
        end
    end
end
