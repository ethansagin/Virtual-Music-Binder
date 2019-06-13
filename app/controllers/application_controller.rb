require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
    if logged_in?
      redirect to '/folders'
    else
      erb :homepage
    end
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end
    
    def current_user
      if logged_in?
        @current_user = User.find_by(id: session[:id])
      end
      @current_user
    end
  end

end
