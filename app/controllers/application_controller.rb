require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end
    
    def curretn_user
      if logged_in?
        @current_user = User.find_by(id: session[:id])
      end
      @current_user
    end
  end

end
