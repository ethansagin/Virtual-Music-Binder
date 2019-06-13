class PiecesController<ApplicationController
  get '/pieces' do
    @user = current_user
    
    erb :'pieces/index'
  end
  
  get '/pieces/new' do
    
  end
  
  post '/pieces' do
    
  end
  
  get '/pieces/:id' do
    
  end
  
  get '/pieces/:id/edit' do
    
  end
  
  patch '/pieces/:id/edit' do
    
  end
  
  delete '/pieces/:id/delete' do
    
  end
end