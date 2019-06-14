class PiecesController<ApplicationController
  get '/pieces' do
    @user = current_user
    
    erb :'pieces/index'
  end
  
  get '/pieces/new' do
    redirect_if_logged_in

    @user = current_user
    erb :'pieces/new'
  end
  
  post '/pieces' do
    if !params[:title].empty?
      piece = Piece.create(params)
      redirect to '/pieces'
    else
      redirect to '/pieces/new'
    end
  end
  
  get '/pieces/:id' do
    redirect_if_logged_in

    @piece = Piece.find_by(id: params[:id])
    if @piece
      erb :'pieces/show'
    else
      redirect to '/pieces'
    end
  end
  
  get '/pieces/:id/edit' do
    redirect_if_logged_in

    @piece = Piece.find_by(id: params[:id])
    if @piece
      erb :'pieces/edit'
    else
      redirect to '/pieces'
    end
  end
  
  patch '/pieces/:id/edit' do
    piece = Piece.find_by(id: params[:id])
    
    if !params.empty?
      piece.update(params)
      redirect to '/pieces'
    else
      redirect to "/pieces/#{params[:id]}/edit"
    end
  end
  
  delete '/pieces/:id/delete' do
    @piece = Piece.find_by(id: params[:id])
    @piece.destroy
    redirect to '/pieces'
  end
end