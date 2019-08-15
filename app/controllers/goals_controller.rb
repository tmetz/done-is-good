class GoalsController < ApplicationController

    before_action :set_goal, only: [:show, :edit, :update, :destroy]

    def new
        @goal = Goal.new
    end

    def create
        @goal = current_user.goals.build(goal_params)
        if @goal.save
            flash[:error] = "You must create at least one task for your goal."
            @task = @goal.tasks.build(description: "Placeholder task - replace this text with your description", user_id: current_user[:id], done: false)
            @task.save
            redirect_to edit_goal_task_path(@goal, @task)
        else
            render :new
        end
    end

    # index only shows goals for the current user.  all shows everybody else's goals.
    def index
        #@goals = Goal.all_for_user(current_user[:id])
        @unfinished = Goal.all_for_user(current_user[:id]).unfinished
        @finished = Goal.all_for_user(current_user[:id]).finished
    end

    def all
        #@goals = Goal.all_for_others(current_user[:id])
        @unfinished = Goal.all_for_others(current_user[:id]).unfinished
        @finished = Goal.all_for_others(current_user[:id]).finished
    end

    def show
    end

    def edit
    end

    def update
        if @goal.update(goal_params)
            redirect_to goal_path(@goal)
        else
            render :edit
        end
    end

    

    def destroy
        @goal.goal_cleanup
        @goal.destroy
        redirect_to goals_path
    end

    private

    def set_goal
        @goal = Goal.find_by(id: params[:id])
        if !@goal
            redirect_to goals_path
        end
    end

    def goal_params
        params.require(:goal).permit(:name, :accomplished)
    end

end
