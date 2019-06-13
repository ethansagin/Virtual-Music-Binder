class UsersController<ApplicationController
  
  get '/users/signup' do
    # if logged_in?
    #   redirect to '/folders/index'
    #else
    erb :'users/signup'
  end
  
  post '/users/signup' do
    params.each do |k, v|
      if v.empty?
        redirect to '/users/signup'
      end
    user = User.create(username: params[:username], email: params[:email] password: params[:password])
    session[:user_id] = user.id
    #redirect to '/folders/index'    
  end
  
end