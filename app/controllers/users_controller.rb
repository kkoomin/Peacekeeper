class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        redirect_to user_path(@user)
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end
    
    def destroy
        @user.destroy
        
    end

    def upload
        uploaded_io = params[:user][:profile_pic_url]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :profile_pic_url)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
