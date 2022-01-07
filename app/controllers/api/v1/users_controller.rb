class Api::V1::UsersController < ApplicationController
    # include UsersHelper
    before_action :logged_in_user , only: [:current_user]
    def sign_up
        user = UsersHelper.register_user(user_params)
        render "create",locals: {user: user}
    end
    def sign_in
        user = AuthHelper.sign_in(params[:username],params[:password])
        render "create",locals: {user: user}
    end
    def current_user
        render "create",locals: {user: @user}
    end
    def logout
        @user.auth_token = nil
        render json: "logout out succussfully"
    end
    private
    def user_params
        params.require(:user).permit(:username,:password,:password_confirmation)   
    end
end
