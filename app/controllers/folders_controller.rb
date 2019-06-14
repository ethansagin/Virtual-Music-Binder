class FoldersController<ApplicationController
  
  get '/folders' do
    @user = current_user

    erb :'folders/index'
  end
  
  get '/folders/new' do
    redirect_if_not_logged_in
    
    @user = current_user
    erb :'folders/new'
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
    redirect_if_not_logged_in

    @folder = Folder.find_by(id: params[:id])
    if @folder.user_id == current_user.id
      erb :'folders/show'
    else
      redirect to '/folders'
    end
  end
  
  get '/folders/:id/edit' do
    redirect_if_not_logged_in

    @folder = Folder.find_by(id: params[:id])
    if @folder.user_id == current_user.id
      erb :'folders/edit'
    else
      redirect to '/folders'
    end
  end
  
  patch '/folders/:id' do
    folder = Folder.find_by(id: params[:id])
    if !params[:name].empty?
      folder.update(name: params[:name])
      redirect to '/folders'
    else
      redirect to "/folders/#{params[:id]}/edit"
    end
  end
  
  delete '/folders/:id/delete' do
    @folder = Folder.find_by(id: params[:id])
    @folder.destroy
    redirect to '/folders'
  end
  
  get '/folders/:id/folders_pieces' do
    redirect_if_not_logged_in
  binding.pry
    @folder = Folder.find_by(params[:id])
    erb :'folders_pieces/show'
  end
  
end