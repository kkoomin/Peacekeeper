class ApplicationController < ActionController::Base
    before_action :current_user
    # before_action :logged_in

    def current_user #get current logged-in user's instance
        @user = (User.find_by(id: session[:user_id]) || User.new)
    end

    # def self.logged_in
    #     if current_user
    #         current_user.nickname
    #     else 
    #         "no one logged in" 
    #     end
    # end

 

    def require_login
        redirect_to login_path unless session[:user_id]
    end
end
