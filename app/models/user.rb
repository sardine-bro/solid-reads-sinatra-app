class User < ActiveRecord::Base
    has_many :posts
    
    has_secure_password
   
    validates :name, :email, :password, :profile_bio, presence: true
end