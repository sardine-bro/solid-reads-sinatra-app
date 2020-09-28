class UsersController < ApplicationController
    
    # Read
    get "/login" do  
        erb :login
    end

    post "/login" do 
        # puts params 
        @user = User.find_by(email: params[:email]) 

        if user && user.authenticate(params[:password])
            # users home page
            # binding.pry
            session[:user_id] = @user.id
            redirect "/users/#{user.id}"
        else
            redirect '/login'
        end
    end

    get "/users/:id" do 
        "Users SHow page"
    end

end