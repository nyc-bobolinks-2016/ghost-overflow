get '/questions' do
  @questions = Question.all
  erb :'questions/questions'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect '/questions'
  else
    "HEY THAT DIDNT SAVE"
  end
end

get '/questions/:id' do
  @question = Question.where("questions_id = ?", params[:id])
end
