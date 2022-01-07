class ApplicationController < ActionController::API
    def auth_header
        request.headers["authorization"]    
    end
    def logged_in_user
        if AuthHelper.decoded_token(auth_header)
            username = AuthHelper.decoded_token(auth_header)[0]['user'].to_s
            @user = UsersHelper.get_user_by_username(username)
        else
            head(:unauthorized)
        end
    end
end
