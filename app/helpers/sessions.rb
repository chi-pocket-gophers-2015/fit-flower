helpers do

	def current_user
		return @user ||= client.user_info['user']#User.find(session[:user_id]) if session[:user_id]
	end

end
