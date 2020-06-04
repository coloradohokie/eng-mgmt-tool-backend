class UsersController < ApplicationController

    def create
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )
        render json: { user:  @user }, status: 201
    end
end
