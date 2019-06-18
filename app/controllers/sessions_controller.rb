class SessionsController<ApplicationController
  
  get '/login' do 
    if logged_in?
      redirect to '/folders'
    else
      erb :'sessions/login'
    end
  end
  
  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/folders'
    else
      redirect to '/signup'
    end
  end
  
  get '/logout' do
    session.clear
    redirect to '/'
  end
  
end