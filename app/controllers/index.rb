get "/" do
  pp client.activities_on_date 'today'
  erb :login
end

get "/profile" do

end

get "/callback" do
  # params.inspect
  # session.inspect
  authorize_user(params[:oauth_verifier])
  # client.inspect
  redirect "/"

end

delete "/sessions" do
  session.clear
  redirect '/'
end
