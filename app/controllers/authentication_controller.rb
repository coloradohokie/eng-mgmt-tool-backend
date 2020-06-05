class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])

        if !@user
            render json: {error: "Bad username"}, status: :unauthorized
        else
            if !@user.authenticate params[:password]
                render json: {error: "Bad Password"}, status: :unauthorized
            else
                payload = {
                    user_id: @user.id,
                    username: @user.username
                }
                secret = Rails.application.secrets.secret_key_base
                token = JWT.encode(payload, secret)
                render json: {token: token, expiration: 3600, user_id: @user.id, username: @user.username}, status: :ok
            end
        end
    end
end
