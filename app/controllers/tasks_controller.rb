class TasksController < ApplicationController
    before_action :require_login

    def new
        if params[:goal_id] && goal = Goal.find_by_id(params[:goal_id])
            @task = goal.tasks.build
        else
            @task = Task.new
        end
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
        if params[:goal_id] && goal = Goal.find_by_id(params[:goal_id])
            @tasks = goal.tasks.order_by_age
        else
            @tasks = Task.order_by_age
        end
    end

    def show
        set_task
    end

    def edit
        set_task
    end

    def update
        set_task
        if @task.update(task_params)
            redirect_to task_path(@task)
        else
            render :edit
        end
    end

    def destroy
        set_task
        @task.destroy
        redirect_to tasks_path
    end

    private

    def set_task
        @task = Task.find_by(id: params[:id])
        if !@task
            redirect_to tasks_path
        end
    end

    def task_params
        params.require(:task).permit(:description, :done, :goal_id)
    end
end
