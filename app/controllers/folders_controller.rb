class FoldersController<ApplicationController
  
  get '/folders' do
    @user = current_user
    
    erb :'folders/index'
  end
  
  get '/folders/new' do
    if logged_in?
      @user = current_user
      erb :'folders/new'
    else
      redirect to '/sessions/login'
    end
  end
  
  post '/folders' do
    
  end
  
  get '/folders/:id' do
    
  end
  
  get '/folders/:id/edit' do
    
  end
  
  patch '/folders/:id/edit' do
    
  end
  
  delete '/folders/:id/delete' do
    
  end
  
end