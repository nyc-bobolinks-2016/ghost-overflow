get '/' do
  'success!!'
end


get '/users/new' do
  erb :register
end

post '/users/new' do
  @user = User.new(params)
  if request.xhr?
    if @user.save
      redirect '/'
    else
      status 422
      JSON.generate(@user.errors.full_messages)
    end
  end
end
