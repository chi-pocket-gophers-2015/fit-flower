get "/" do

  redirect "/profile" if client
  erb :login
end

get "/profile" do
  redirect "/" unless client
  # pp "calories are: #{client.activities_on_date('today')["summary"]["caloriesOut"]}"
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

post "/flower-logic" do
  #do flower logic
  content_type :json
  {flower_id: calculate_flower_id }.to_json
end
