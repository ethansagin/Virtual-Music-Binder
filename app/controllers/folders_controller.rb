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
    if logged_in?
      @folder = Folder.find_by(id: params[:id])
      if @folder.user_id == current_user.id
        erb :'folders/show'
      else
        redirect to '/folders'
      end
    else
      redirect to 'sessions/login'
    end
  end
  
  get '/folders/:id/edit' do
    if logged_in?
      @folder = Folder.find_by(id: params[:id])
      if @folder.user_id == current_user.id
        erb :'folders/edit'
      else
        redirect to '/folders'
      end
    else
      redirect to 'sessions/login'
    end
  end
  
  patch '/folders/:id/edit' do
    folder = Folder.find_by(id: params[:id])
    
    if !params[:name].empty?
      folder.update(name: params[:name])
      redirect to '/folders'
    else
      redirect to "/folders/#{params[:id]}/edit"
    end
  end
  
  delete '/folders/:id/delete' do
    
  end
  
end