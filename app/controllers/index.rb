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
  flower_hash = calculate_flower_id
  content_type :json
  {flower_id: flower_hash[:id], goal: flower_hash[:goal],
  burned: flower_hash[:burned] }.to_json
end
