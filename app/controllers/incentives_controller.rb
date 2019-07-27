class IncentivesController < ApplicationController
    def new
        if params[:goal_id] && goal = Goal.find_by_id(params[:goal_id])
            @incentive = goal.incentives.build
        else
            @incentive = Incentive.new
        end
    end

    def create
        @incentive = current_user.incentives.build(incentive_params)

        if @incentive.save
            redirect_to incentive_path(@incentive)
        else
            render :new
        end
    end

    def index
        if params[:goal_id] && goal = Goal.find_by_id(params[:goal_id])
            @incentives = goal.incentives.all
        else
            @incentives = Incentive.all
        end
    end

    def show
        set_incentive
    end

    def edit
        set_incentive
    end

    def update
        set_incentive
        if @incentive.update(incentive_params)
            redirect_to incentive_path(@incentive)
        else
            render :edit
        end
    end

    def destroy
        set_incentive
        @incentive.destroy
        redirect_to incentives_path
    end

    private

    def set_task
        @incentive = Incentive.find_by(id: params[:id])
        if !@incentive
            redirect_to incentives_path
        end
    end

    def incentive_params
        params.require(:incentive).permit(:description, :goal_id)
    end
end
