get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  if logged_in?
    @question = Question.new(params[:question])
    @question.user_id = logged_in_user.id
    p '*'*100
    p @question
    p session
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
  @question = Question.find_by(id: params[:id])
  erb :'questions/show'
end
