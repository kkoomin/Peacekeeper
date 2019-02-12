class PostsController < ApplicationController

    def index
        @posts = Post.all
        @post = Post.new
    end 

    def show
        @post = Post.find(params[:id])
    end

    def new
    end

    def create
        @post = Post.create(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to posts_path
    end

    def edit
        @post = Post.find(params[:id])
    end 

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to posts_path
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:content)
    end 
end
