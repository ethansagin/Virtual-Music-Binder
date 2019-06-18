require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
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
        @current_user = User.find_by(id: session[:user_id])
      end
      @current_user
    end
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect to '/login'
      end
    end
    
    def authorized_to_edit?(obj)
      current_user.id == obj.user_id
    end
  end

end