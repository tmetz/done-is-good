require 'securerandom'

class SessionsController < ApplicationController

    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to goals_path
        else
            flash[:error] = "Sorry, your username or password is incorrect."
            redirect_to '/login'
        end
    end

    def ghcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end
        
        session[:user_id] = @user.id
        redirect_to '/goals'
    end

    def home
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end
