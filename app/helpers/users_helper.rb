module UsersHelper
    class << self
        def get_user_by_username(username)
            user = User.find_by(username:username)
        end
        def register_user(user_params)
            user = User.new(user_params)
            user.save! ? user : user.errors
        end
    end
end
