class ApplicationController < ActionController::Base
    include ApplicationHelper

    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
