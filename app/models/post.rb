class Post < ActiveRecord::Base
    belongs_to :user

    validates :title, :review, :author, presence: true
    
end
