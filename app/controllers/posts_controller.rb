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
        @post = Post.create(title: params[:title], review: params[:review], user_id: current_user.id)

        redirect "/posts/#{@post.id}"
    end

# R/Show
    get '/posts/:id' do 
        @post = Post.find(params[:id])

       erb :'/posts/show'
    end

    
# U
    get '/posts/:id/edit' do  #load edit form
        @post = Post.find(params[:id])
        erb :'/posts/edit'
    end

    patch '/posts/:id' do #edit action
        @post = Post.find(params[:id])
        @post.update(title: params[:title], review: params[:review])
        
        redirect "/posts/#{@post.id}"
    end

# D

    delete '/posts/:id' do 
        @post = Post.find(params[:id])
        @post.destroy

        redirect '/posts'
    end
end