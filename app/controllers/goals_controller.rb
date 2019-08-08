class GoalsController < ApplicationController

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
        @goals = Goal.all_for_user(current_user[:id])
    end

    def all
        @goals = Goal.all_for_others(current_user[:id])
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
        goal_cleanup
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

    def goal_cleanup
        @goal.incentives.each do |i|
            i.destroy
        end
        @goal.tasks.each do |t|
            t.destroy
        end
    end
end
