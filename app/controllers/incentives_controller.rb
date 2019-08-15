class IncentivesController < ApplicationController

    before_action :set_incentive, only: [:show, :edit, :update, :destroy]
    
    def new
        if params[:goal_id] && goal = Goal.find_by_id(params[:goal_id])
            @incentive = goal.incentives.build
        else
            @incentive = Incentive.new
        end
    end

    def create
        @incentive = Incentive.new(incentive_params)

        if @incentive.save
            redirect_to incentive_path(@incentive)
        else
            render :new
        end
    end

    def index
        if params[:goal_id]
            goal = Goal.find_by_id(params[:goal_id])
            if goal
                @incentives = goal.incentives.all
            else
                redirect_to goals_path
            end
        else
            @incentives = Incentive.all_for_user(current_user[:id])
        end
    end

    def show
    end

    def edit
    end

    def update
        if @incentive.update(incentive_params)
            redirect_to incentive_path(@incentive)
        else
            render :edit
        end
    end

    def destroy
        @incentive.destroy
        redirect_to incentives_path
    end

    private

    def set_incentive
        @incentive = Incentive.find_by(id: params[:id])
        if !@incentive
            redirect_to incentives_path
        end
    end

    def incentive_params
        params.require(:incentive).permit(:description, :num_tasks, :goal_id)
    end
end
