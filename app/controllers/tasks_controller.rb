class TasksController < ApplicationController
    before_action :find_user, only: [:show, :edit, :destroy]

    def index
        @tasks = Task.all
    end

    def show
    end

    def new
        @task = Task.new
        @status_list = ["uncompleted", "claimed", "completed"]
    end

    def create
        @task = Task.create(task_params)
        redirect_to task_path(@task)
    end

    def edit
        @task.update(task_params)
    end

    def destroy
        @task.destroy
        
    end

    private

    def task_params
        params.require(:task).permit(:name, :description, :status, :deadline, :pinned, :user_id)
    end

    def find_task
        @task = task.find(params[:id])
    end
end
