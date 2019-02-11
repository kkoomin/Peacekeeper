class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :edit, :destroy]

    def index
        @comments = Comment.all
    end

    def show
    end

    def new
        #@comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        @task = Task.find(@comment.task_id)
        redirect_to task_path(@task)
    end

    def edit
        @comment.update(comment_params)
    end

    def destroy
        @comment.destroy
        
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :task_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
