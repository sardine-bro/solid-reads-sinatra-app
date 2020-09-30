class User < ActiveRecord::Base
    has_many :posts
    # has its own validator for password
    has_secure_password
   
    validates :email, uniqueness: true
    validates :name, :profile_bio, presence: true
end