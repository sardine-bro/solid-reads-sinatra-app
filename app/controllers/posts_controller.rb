class PostsController < ApplicationController

# initiate CRUD

# R/Index
    get '/posts' do 
        @posts = Post.all
        
        erb :'/posts/index'
    end

# C/New
    get '/posts/new' do 
        if logged_in?
            erb :'/posts/new'
        else
            flash[:error] = "You must be logged in to create a review"
            redirect '/'
        end
    end

    post '/posts' do
        @post = Post.new(title: params[:title], review: params[:review], user_id: current_user.id)
        if @post.save
            flash[:message] = "Your Review has been posted!"
            redirect "/posts/#{@post.id}"
        else
            # binding.pry
            flash[:error] = "Review creation has failed: #{@post.errors.full_messages.to_sentence}"
            redirect '/posts/new'
        end
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