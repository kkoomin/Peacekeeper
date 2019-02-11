class ApplicationController < ActionController::Base
    before_action :current_user

    def current_user #get current logged-in user's id
        @user = (User.find_by(id: session[:user_id]) || User.new)
    end

    private

    def require_login
        redirect_to login_path unless session[:user_id]
    end
end
