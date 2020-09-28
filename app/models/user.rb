class User < ActiveRecord::Base
    has_secure_password
    has_many :posts
    # add user validations
end