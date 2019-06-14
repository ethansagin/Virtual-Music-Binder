class SessionsController<ApplicationController
  
  get '/sessions/login' do 
    redirect_if_logged_in
    
    redirect to '/folders'
  end
  
  post '/sessions/login' do
    user = current_user
    
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