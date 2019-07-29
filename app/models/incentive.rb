class Incentive < ApplicationRecord
    belongs_to :goal

    validate :max_tasks

    def max_tasks
        errors.add(:num_tasks, "must be less than or equal to total tasks in goal") if num_tasks > goal.tasks.count
    end

    def percent_complete
        if self.goal?
            100 * self.goal.tasks.where(done: true).count / self.num_tasks
        else
            0
        end
    end
end
