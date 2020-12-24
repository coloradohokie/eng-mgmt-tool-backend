class ApplicationController < ActionController::API

    before_action :authenticate

    def authenticate
        authorization_header = request.headers["Authorization"]

        if !authorization_header
            render json: {error: "No token present"}, status: :unauthorized
        else
            begin
                token = authorization_header.split(' ')[1]
                secret = Rails.application.secret_key_base
                payload = JWT.decode(token, secret).first
                @user = User.find payload["user_id"]
            rescue
                render json: { error: "Invalid Token" }, status: :unauthorized
            end
        end
    end

end
