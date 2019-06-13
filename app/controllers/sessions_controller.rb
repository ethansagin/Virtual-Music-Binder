class SessionsController<ApplicationController
  
  get '/sessions/login' do 
    if logged_in?
      redirect to '/folders'
    else
      erb :'sessions/login'
    end
  end
  
  post '/sessions/login' do
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/folders'
    else
      redirect to '/users/signup'
    end
  end
  
  get '/sessions/logout' do
    session.clear
    redirect to '/'
  end
  
end