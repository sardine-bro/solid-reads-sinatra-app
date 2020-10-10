class UsersController < ApplicationController

    get "/login" do  
        erb :'/users/login'
    end

    post "/login" do 
        @user = User.find_by(email: params[:email]) 

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:message] = "Welcome back #{@user.name}!"
            redirect "/users/#{@user.id}"
        else
            flash[:error] = "Sorry your credentials were invalid, please try again"
            redirect '/login'
        end
    end

    get '/users/most-reviews' do
        # binding.pry
        @users = User.all
        @most_review = @users.max_by{|user| user.posts.count}
        # most_review.name

        # binding.pry
        erb :'/users/most'
    end
    
    get "/users/:id" do 
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get '/signup' do
        erb :'users/signup'
    end

    post '/users' do 
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else 
            flash[:error] = "Input is not valid: #{@user.errors.full_messages.to_sentence}"
            redirect '/signup'
        end
    end


    get '/logout' do 
        session.clear
        redirect '/'
    end

end

#write a custom method so that when a user visits /users/most-reviews, they are able to see (by anymeans necessary, there are a lot of options for how to do this, you pick which one) the user with th emost reviwes. 

#HINT: Use the max_by ruby method to help you find the user with the most reviews 

#If you run into a wall while you're debugging, make sure you're checking which route you're actually hittin gin the controller 

