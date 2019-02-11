class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :edit, :destroy]

    def index
        @comments = Comment.all
    end

    def show
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to comment_path(@comment)
    end

    def edit
        @comment.update(comment_params)
    end

    def destroy
        @comment.destroy
        
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
