class FoldersController<ApplicationController
  
  get '/folders' do
    @user = current_user
    
    erb :'folders/index'
  end
  
  get '/folders/new' do
    
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