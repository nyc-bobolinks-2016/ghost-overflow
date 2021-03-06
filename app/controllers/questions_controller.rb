get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  if logged_in?
    erb :'questions/new'
  else
    @errors = ['You need to login first!']
    redirect '/login'
  end
end

post '/questions' do
  if logged_in?
    @question = Question.new(params[:question])
    @question.user_id = logged_in_user.id
  else
    @errors = ['Youre not logged in']
  end
  if @question.save
    redirect '/questions'
  else
    "HEY THAT DIDNT SAVE"
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
