def logged_in?
  !!(session[:id])
end

def logged_in_user
  User.find(session[:id])
end
