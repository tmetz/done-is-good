class UsersController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to tasks_path
        else
            render :new
        end
    end

    def active
        @users = User.all_active
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
