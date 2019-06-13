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
    if !params[:name].empty?
      folder = Folder.create(name: params[:name], user_id: current_user.id)
      redirect to '/folders'
    else
      redirect to '/folders/new'
    end
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