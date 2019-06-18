class UsersController<ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect to '/folders'
    else
      erb :'users/signup'
    end
  end
  
  post '/signup' do
    params.each do |k, v|
      if v.empty?
        redirect to '/signup'
      end
    end
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to '/folders'    
  end
  
end