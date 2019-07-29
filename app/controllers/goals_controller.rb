class GoalsController < ApplicationController
    before_action :require_login

    def new
        @goal = Goal.new
    end

    def create
        @goal = current_user.goals.build(goal_params)
        if @goal.save
            flash[:error] = "You must create at least one task for your goal."
            redirect_to new_goal_task_path(@goal)
        else
            render :new
        end
    end

    def index
        @goals = current_user.goals.all
    end

    def show
        set_goal
    end

    def edit
        set_goal
    end

    def update
        set_goal
        if @goal.update(goal_params)
            redirect_to goal_path(@goal)
        else
            render :edit
        end
    end

    def destroy
        set_goal
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
