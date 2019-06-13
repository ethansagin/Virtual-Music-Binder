class UsersController<ApplicationController
  
  get '/users/signup' do
    # if logged_in?
    #   redirect to '/folders/index'
    #else
    erb :'users/signup'
  end
  
  post '/users/signup' do
    
  end
  
end