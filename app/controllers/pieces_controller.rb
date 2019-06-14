class PiecesController<ApplicationController
  get '/pieces' do
    @user = current_user
    
    erb :'pieces/index'
  end
  
  get '/pieces/new' do
    redirect_if_not_logged_in

    @user = current_user
    erb :'pieces/new'
  end
  
  post '/pieces' do
    if !params[:title].empty? && !params[:composer].empty?
      piece = Piece.new(params)
      piece.user_id = current_user.id
      piece.save
      redirect to '/pieces'
    else
      redirect to '/pieces/new'
    end
  end
  
  get '/pieces/:id' do
    redirect_if_not_logged_in

    @piece = Piece.find_by(id: params[:id])
    if @piece
      erb :'pieces/show'
    else
      redirect to '/pieces'
    end
  end
  
  get '/pieces/:id/edit' do
    redirect_if_not_logged_in

    @piece = Piece.find_by(id: params[:id])
    if @piece
      erb :'pieces/edit'
    else
      redirect to '/pieces'
    end
  end
  
  patch '/pieces/:id' do
    @piece = Piece.find_by(id: params[:id])
    if params[:title].empty? || params[:composer].empty?
      redirect to "/pieces/#{@piece.id}/edit"
    else
      @piece.title = params[:title]
      @piece.composer = params[:composer]
      @piece.from_work = params[:from_work]   
      @piece.year = params[:year]  
      @piece.lyricist = params[:lyricist]
      @piece.genre = params[:genre]
      @piece.language = params[:language] 
      @piece.translation = params[:translation]
      @piece.save
      redirect to '/pieces'
    end
  end
  
  delete '/pieces/:id/delete' do
    @piece = Piece.find_by(id: params[:id])
    @piece.destroy
    redirect to '/pieces'
  end
end