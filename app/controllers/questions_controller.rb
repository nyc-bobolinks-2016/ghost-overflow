get '/questions' do

end

get '/questions/new' do
  if 
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
