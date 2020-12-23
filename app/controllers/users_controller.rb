class UsersController < ApplicationController

    skip_before_action :authenticate, only: [:create, :index]

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
