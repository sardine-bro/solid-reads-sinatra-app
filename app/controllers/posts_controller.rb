class PostsController < ApplicationController

# initiate CRUD

# R
    get '/posts' do 
        @posts = Post.all
        
        erb :'/posts/index'
    end

    get '/posts/:id' do 
        # binding.pry
       @post = Post.find(params[:id])

       erb :'/posts/show'
    end
# C

# U

# D
end