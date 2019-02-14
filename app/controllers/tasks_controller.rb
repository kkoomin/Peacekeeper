class TasksController < ApplicationController
    before_action :find_task, only: [:show, :edit, :update, :toggle_status, :toggle_claim, :destroy]
    before_action :authorized? 

    def index
        @tasks = Task.all
    end

    def show
    end

    def new
        @task = Task.new
        @users = User.all
    end

    def create
        @task = Task.create(task_params)
        @task.user_id = current_user.id
        @task.save
        redirect_to task_path(@task)
    end
    
    def edit
        @users = User.all
    end

    def update
        @task.update(task_params)
        if @user.valid? #&& @user.image.attached?
            redirect_to task_path(@task)
        else
            render :edit 
        end
        
    end

    def toggle_claim
        if @task.claimer == current_user.id
            @task.claimer = nil
        else
            @task.claimer = current_user.id
        end
        @task.save
        redirect_to tasks_path
    end

    def toggle_status
        @task.toggle!(:status)
        if @task.status == false
            @task.completer = nil
        else
            @task.completer = current_user.id
        end
        @task.save
        redirect_to tasks_path
    end

    def toggle_pinned
        @task.toggle!(:pinned)
        redirect_to task_path(@task)
    end

    def destroy
        @task.destroy
        redirect_to tasks_path
    end

    private

    def task_params
        params.require(:task).permit(:name, :description, :status, :deadline, :pinned, :claimer)
    end

    def find_task
        @task = Task.find(params[:id])
    end
end
