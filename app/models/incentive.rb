class Incentive < ApplicationRecord
    belongs_to :goal
    belongs_to :user

    validate :max_tasks

    def max_tasks
        errors.add(:num_tasks, "must be less than or equal to total tasks in goal") if num_tasks > goal.tasks.count
    end

    def percent_complete
        100 * self.goal.tasks.where(done: true).count / self.num_tasks
    end

    def self.all_for_user(user_id)
        joins(goal: [:users]).where("users.id = ?", user_id).distinct
    end
end
