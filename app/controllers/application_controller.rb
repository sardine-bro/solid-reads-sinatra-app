require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
   
    enable :sessions 
    set :session_secret, "super_duper_secret_guest_1234"
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def current_user
      User.find_by(id: session[:user_id])
    end
  end

end
