class UsersController < ApplicationController

    def create
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )
        render json: { user:  @user }, status: 201
    end

    def index
        @users = User.all
        render json: @users, status: 200
    end
end
