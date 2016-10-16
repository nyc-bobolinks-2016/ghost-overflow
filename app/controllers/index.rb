get '/' do
  p '*'*1000
  p session
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do

  if @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect '/'
    else
      @errors = ["Incorrect Password"]
      erb :'/login'
    end
  else
    @errors = ["User Not Found: Incorrect Email"]
    erb :'/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
