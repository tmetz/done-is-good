class TasksController < ApplicationController


    def new
        @task = Task.new
    end

    def create
        @task = current_user.tasks.build(task_params)

        if @task.save
            redirect_to task_path(@task)
        else
            render :new
        end
    end

    def index
        @tasks = Task.all
    end

    def show
        set_task
    end

    def edit
        set_task
    end

    private

    def set_task
        @task = Task.find_by(id: params[:id])
        if !@task
            redirect_to tasks_path
        end
    end

    def task_params
        params.require(:task).permit(:description, :done)
    end
end
