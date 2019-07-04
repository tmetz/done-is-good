class TasksController < ApplicationController
    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params(:description))

        if @task.save
            redirect_to task_path(@task)
        else
            render :new
        end
    end

    private

    def task_params
        params.require(:task).permit(:description)
end
