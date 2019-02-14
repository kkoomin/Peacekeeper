class SessionsController < ApplicationController

    def home
        @tasks = Task.all
        @posts = Post.all
        @last_post = @posts.sort_by{|p| p.updated_at }.last
        @users = User.all
        @most_contributor_id = @tasks.map{|t|t.completer}.max_by{ |i| @tasks.map{|t|t.completer}.count(i)}
        @most_contributor = User.find(@most_contributor_id)
        @contribute_times = @tasks.map{|t|t.completer}.count(@most_contributor_id)
    end

    def new
        if logged_in?
            redirect_to home_path
        end
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        @user = @user.try(:authenticate, params[:user][:password])
        return redirect_to login_path unless @user
        session[:user_id] = @user.id
        redirect_to home_path
        
    end

    def destroy
        session.delete :user_id
        #or "session[:user_id]   = nil"
        redirect_to login_path
    end

end