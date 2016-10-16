get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  if request.xhr?
     erb :'/_new_comments', layout: false, locals: { question: @question}
  else
    erb :'_new_comments'
  end
end

post '/questions/:id/comments/new' do
  @comment = Comment.new(params[:comment])
  @comment.user = logged_in_user
  @question = Question.find_by(id: params[:id])
  @comment.commentable = @question
  @comment.save
  if request.xhr?
    erb :'/_comments', layout: false, locals: { comment: @comment }
  else
    redirect "/questions/#{@question.id}"
  end
end

get '/comments/:id/delete' do
  @comment = Comment.find(params[:id])
  @question_id = @comment.commentable_id
  if @comment.user == logged_in_user
    @comment.destroy
  else
    @errors = ["NAh"]
  end
end

get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  if request.xhr?
    erb :'_new_answer_comments', layout: false, locals: {answer: @answer}
  else
    erb :'_new_answer_comments'
  end
end

post '/answers/:id/comments/new' do
  @comment = Comment.new(params[:comment])
  @comment.user = logged_in_user
  @answer = Answer.find(params[:id])
  @comment.commentable = @answer
  @comment.save
  if request.xhr?
    erb :'/_comments', layout: false, locals: { comment: @comment }
  else
    redirect "/questions/#{@answer.question_id}"
  end
end
