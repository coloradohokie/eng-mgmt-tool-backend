class ApplicationController < ActionController::API

    before_action :authenticate

    def authenticate
        header = request.headers["Authorization"]

        if !header
            render json: {error: "no token present"}, status: :unauthorized
        else
            begin
                token = header.split(" ")[1]
                secret = Rails.application.secrets.secret_key_base
                payload = JWT.decode(token, secret)[0]
                @user =  payload["user_id"]
            rescue
                render json: {error: "Bad token"}, status: :unauthorized
            end
        end
    end
end

