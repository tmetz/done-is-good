class GoalsController < ApplicationController
    def new
        @goal = Goal.new
    end

    def create
    end

    def index
        @goals = Goal.all
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
        @goal = Task.find_by(id: params[:id])
        if !@goal
            redirect_to goals_path
        end
    end

    def goal_params
        params.require(:goal).permit(:name, :accomplished)
    end
end
