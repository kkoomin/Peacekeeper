class PostsController < ApplicationController

    def index
        @posts = Post.all
        @post = Post.new
    end 

    def show

    end

    def new
        #@post = Post.new
    end

    def create
       
        @post = Post.create(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to posts_path
    end

    def edit
    end 

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:content)
    end 
end
