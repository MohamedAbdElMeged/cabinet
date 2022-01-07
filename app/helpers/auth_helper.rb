module AuthHelper
    class << self
        include BCrypt
        def encode_token(payload)
            JWT.encode(payload,APP_CONFIG['jwt_secret'])  
          end

          def create_token(username)
            exp = (Time.now + APP_CONFIG['jwt_expiration'].minutes).to_i
            encode_token({user: username ,exp: exp})
          end
          def decoded_token(auth_header)
              if auth_header
                  token = auth_header.split(' ')[1]
                  begin
                      JWT.decode(token, APP_CONFIG['jwt_secret'], true, algorithm: 'HS256')
                  rescue JWT::ExpiredSignature
                  nil
                  end
              end
          end
          def sign_in(username,password)
            user = UsersHelper.get_user_by_username(username)
            if user && validate_password?(user,password)
               user.auth_token = create_token(username)
                return user
            end
          end
          def validate_password?(user,password)
            BCrypt::Password.new(user.password_digest) == password 
          end
          
    end
end
