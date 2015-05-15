get "/" do
  erb :login
end

get "/profile" do

end

get "/callback" do
  params.inspect
  # session.inspect
end

post "/sessions" do

end

delete "/sessions" do

end
