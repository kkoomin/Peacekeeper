class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
        authorized_for(params[:id])
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end
    
    def destroy
        @user.destroy
        redirect_to login_path
    end

    def upload
        uploaded_io = params[:user][:profile_pic_url]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :profile_pic_url, :admin)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
