class PostsController < ApplicationController

# initiate CRUD

# R/Index
    get '/posts' do 
        @posts = Post.all
        
        erb :'/posts/index'
    end

# C/New
    get '/posts/new' do 
        erb :'/posts/new'
    end

    post '/posts' do
        post = Post.create(title: params[:title], review: params[:review], user_id: current_user.id)

        redirect "/posts/#{post.id}"
    end

# R/Show
    get '/posts/:id' do 
        @post = Post.find(params[:id])

       erb :'/posts/show'
    end

    
# U
    get '/articles/:id/edit' do  #load edit form
        @article = Article.find_by_id(params[:id])
        erb :edit
    end

# D
end