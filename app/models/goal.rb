class Goal < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    has_many :incentives

    scope :finished, -> {where(accomplished: true)}
    scope :unfinished, -> {where(accomplished: false)}

    def percent_complete
        if self.tasks.count == 0
            0
        else
            100 * self.tasks.where(done: true).count / self.tasks.count
        end
    end

end
