get "/" do
  # pp client.activities_on_date 'today'
  redirect "/profile" if client
  erb :login
end

get "/profile" do
  erb :profile
end

get "/callback" do
  # params.inspect
  # session.inspect
  authorize_user(params[:oauth_verifier])
  # client.inspect
  redirect "/profile"
end

delete "/sessions" do
  session.clear
  redirect '/'
end
