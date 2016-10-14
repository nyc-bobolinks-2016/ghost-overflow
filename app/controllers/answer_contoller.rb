get '/answers/_show' do
  "ANSWERS VIEW I GUESS"
end

get '/answers/new' do
  if request.xhr?
    erb :'/answers/new', layout: false
  else
    erb :'/answers/new'
  end
end

post '/answers' do
  if logged_in?
    @answer = Answer.new(params[:question])
    @answer.save
    redirect '/answers/_show'
  else
    "HEY THAT DIDNT SAVE"
  end
end
