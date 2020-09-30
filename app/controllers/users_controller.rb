class UsersController < ApplicationController
    
    get "/login" do  
        erb :'/users/login'
    end

    post "/login" do 
        @user = User.find_by(email: params[:email]) 

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:message] = "Glad to see you back #{@user.name}"
            redirect "/users/#{@user.id}"
        else
            flash[:error] = "Sorry your credentials were invalid, please try again"
            redirect '/login'
        end
    end

    get "/users/:id" do 
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get '/signup' do
        erb :'users/signup'
    end

    post '/users' do 
        @user = User.create(params)
        @user.save
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end

end