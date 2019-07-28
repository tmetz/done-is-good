class Incentive < ApplicationRecord
    belongs_to :goal

    def percent_complete
        100 * self.goal.tasks.where(done: true).count / self.num_tasks
    end
end
