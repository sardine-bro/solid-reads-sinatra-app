class Post < ActiveRecord::Base
    belongs_to :user

    validates :title, :review, presence: true
    
end
