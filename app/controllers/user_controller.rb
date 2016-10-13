get '/' do
  'success!!'
end


get '/users/new' do
  erb :register
end

post '/users/new' do
  @user = User.new(params)
  if @user.save
    redirect '/'
  else
    puts 'ERRORS DETECTED! DETAILS TO FOLLOW:'
    @user.errors.full_messages.each do |error|
      puts error
    end
  end
end
