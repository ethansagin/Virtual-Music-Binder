class SessionsController<ApplicationController
  
  get '/sessions/login' do 
    if logged_in?
      redirect to '/folders'
    else
      erb :'sessions/login'
    end
  end
  
  # post '/sessions/login' do
    
  # end
  
  # get '/sessions/logout' do
    
  # end
  
  # post '/sessions/logout' do
    
  # end
  
end