get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  if request.xhr?
    erb :'/answers/new', layout: false, locals: { question: @question}
  else
    erb :'/answers/new'
  end
end

post '/questions/:id/answers/new' do
  if logged_in?
    @answer = Answer.new(params[:answer])
    @answer.user_id = logged_in_user.id
    @answer.question_id = params[:id]
    @answer.save
    erb :'/answers/index', layout: false, locals:{answer: @answer}
  else
    "HEY THAT DIDNT SAVE"
  end
end

get '/answer/:id/delete' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "/questions"
end
