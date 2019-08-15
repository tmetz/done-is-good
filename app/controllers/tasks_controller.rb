class TasksController < ApplicationController

    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def new
        @goals = Goal.all_for_user(current_user[:id])
        if params[:goal_id] && goal = Goal.find_by_id(params[:goal_id])
            @task = goal.tasks.build
        else
            @task = Task.new
            @task.user = current_user
            @task.build_goal # build_goal because task belongs_to goal
        end
    end

    def create
        @task = current_user.tasks.build(task_params)

        if @task.save
            redirect_to task_path(@task)
        else
            @goals = Goal.all_for_user(current_user[:id])
            @task.build_goal
            render :new
        end
    end

    def index
        if params[:goal_id]
            goal = Goal.find_by_id(params[:goal_id])
            if goal
                @tasks = goal.tasks.order_by_age
            else
                redirect_to goals_path
            end
        else
            @tasks = current_user.tasks.order_by_age
        end
    end

    def show
    end

    def edit
        @goals = Goal.all_for_user(current_user[:id])
    end

    def update
        if @task.update(task_params)
            redirect_to task_path(@task)
        else
            render :edit
        end
    end

    def adduser
        @task = current_user.tasks.build(description: params[:description], done: false, goal_id: params[:goal_id])

        if @task.save
            redirect_to task_path(@task)
        else
            render :new
        end
    end

    def destroy
        if @task.goal.last_task? # if the last task is deleted, we need to delete the whole goal or stuff breaks
            @task.goal.incentives.each do |i|
                i.destroy
            end
            flash[:error] = "The goal #{@task.goal.name} has no more tasks, so it has been deleted."
            @task.goal.destroy
        end
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
        params.require(:task).permit(:description, :done, :goal_id, goal_attributes: [:name, :accomplished])
    end
end
