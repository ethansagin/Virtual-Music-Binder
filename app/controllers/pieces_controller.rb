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
    # redirect_if_logged_in

    # @piece = Piece.find_by(id: params[:id])
    # erb :'pieces/show'
    # else
    # redirect to '/pieces'

  end
  
  get '/pieces/:id/edit' do
    
  end
  
  patch '/pieces/:id/edit' do
    
  end
  
  delete '/pieces/:id/delete' do
    
  end
end