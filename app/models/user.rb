class User < ApplicationRecord
    has_many :documents
    has_secure_password
    validates :username, uniqueness: {message: "is already taken"}
    attr_accessor :auth_token


end
