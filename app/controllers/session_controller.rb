class SessionController < ApplicationController

	def create
		puts User.all.to_json
		auth = request.env["omniauth.auth"].to_yaml
		user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
		session[:user_id] = user.id
		redirect_to root_url, :notice => "Signed in successfully!"
		puts current_user
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Signed out successfully!"
	end
	
end
