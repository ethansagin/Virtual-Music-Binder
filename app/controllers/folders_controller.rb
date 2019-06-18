class FoldersController<ApplicationController
  
  get '/folders' do
    @user = current_user

    erb :'folders/index'
  end
  
  get '/folders/new' do
    redirect_if_not_logged_in
    
    erb :'folders/new'
  end
  
  post '/folders' do
    if !params[:name].empty?
      folder = current_user.folders.create(name: params[:name])
      redirect to '/folders'
    else
      redirect to '/folders/new'
    end
  end
  
  get '/folders/:id' do
    redirect_if_not_logged_in

    @folder = Folder.find_by(id: params[:id])
    
    if authorized_to_edit?(@folder)
      if @folder
        erb :'folders/show'
      else
        redirect to '/folders'
      end
    end
  end
  
  get '/folders/:id/edit' do
    redirect_if_not_logged_in

    @folder = Folder.find_by(id: params[:id])
    
    if authorized_to_edit?(@folder)
      if @folder
        erb :'folders/edit'
      else
        redirect to '/folders'
      end
    end
  end
  
  patch '/folders/:id' do
    folder = Folder.find_by(id: params[:id])

    if authorized_to_edit?(folder)
      if !!params[:name]
        if !params[:name].empty?
          folder.update(name: params[:name])
          redirect to '/folders'
        else
          redirect to "/folders/#{params[:id]}/edit"
        end
      elsif defined?(params[:folder][:piece_id])
        folder.pieces.clear
        params[:folder][:piece_id].each do |p_id|
          folder.pieces << Piece.find_by(id: p_id)
        end
        redirect to "/folders/#{params[:id]}"
      else
        folder.pieces.clear
        redirect to "/folders/#{params[:id]}"
      end
    end
  end
  
  delete '/folders/:id/delete' do
    @folder = Folder.find_by(id: params[:id])
    
    if authorized_to_edit?(@folder)
      @folder.destroy
      redirect to '/folders'
    end
  end
  
  get '/folders/:id/pieces/edit' do
    redirect_if_not_logged_in

    @folder = Folder.find_by(id: params[:id])
    @pieces = current_user.pieces.all
    erb :'folders/pieces/edit'
  end

end