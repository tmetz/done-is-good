class Incentive < ApplicationRecord
    belongs_to :goal

    def percent_complete
        100 * self.goal.tasks.where(done: true).count / self.goal.tasks.count
    end
end
