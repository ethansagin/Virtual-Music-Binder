class FoldersController<ApplicationController
  
  get '/folders' do
    @user = User.find_by(id: session[:user_id])
    
    erb :'folders/index'
  end
  
end