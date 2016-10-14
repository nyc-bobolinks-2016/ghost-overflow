get '/answers' do
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
    p '*******************************************'
    p params
    p '*******************************************'
    @answer = Answer.new(params[:answer])
    @answer.save
    erb :'/answers/index', layout: false, locals:{answer: @answer}
  else
    "HEY THAT DIDNT SAVE"
  end
end
