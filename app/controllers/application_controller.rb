class ApplicationController < ActionController::API
    def authenticate
        authorization_header = request.headers["Authorization"]

        if !authorization_header
            render json: {error: "Must be logged in"}, status: :unauthorized
        else
            token = authorization_header.split(' ')[1]
            secret = Rails.application.secrets.secret_key_base

            begin
                payload = JWT.decode(token, secret).first
            rescue
                render json: { error: "Invalid Token" }, status: :unauthorized
            end
        end
    end

end
