class ApplicationController < ActionController::API
    include ::ActionController::Cookies
       def current_user
           User.find_by(id: session[:user_id])
           # finding the user by using the user_id in the sessions controller create action
       end

       def logged_in?
           !!current_user
       end

end