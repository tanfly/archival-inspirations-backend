class SessionsController < ApplicationController


	def create
		user = User.find_by(username: params[:session][:username])

		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			byebug
			render json: UserSerializer.new(user)

		else
			render json: {
				error: "Invalid Credentials"
			}
	end
end

	def get_current_user
		current_uri = request.env['PATH_INFO']
		if logged_in?
			render json: UserSerializer.new(current_user)
		elsif 
			current_uri == "/" || "/signup" || "/login"
			render :nothing => true, :status => 204
		else
			render json: {
				error: "Please Log in!"
			}
		end
	end

	def destroy
		session.clear
		render json: {
			notice: "Successfully logged out"
		}, status:200
	end
end
