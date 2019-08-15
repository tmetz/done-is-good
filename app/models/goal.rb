class Goal < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    has_many :incentives

    validates :name, presence: true

    scope :finished, -> {where(accomplished: true)}
    scope :unfinished, -> {where(accomplished: false)}

    def percent_complete
        100 * self.tasks.where(done: true).count / self.tasks.count
    end

    def distinct_users
        self.users.distinct
    end

    def last_task?
        if self.tasks.count <= 1
            true
        else
            false
        end
    end

    def goal_cleanup
        self.incentives.each do |i|
            i.destroy
        end
        self.tasks.each do |t|
            t.destroy
        end
    end

    def self.all_for_user(user_id)
        joins(:users).where("users.id = ?", user_id).distinct
    end

    def self.all_for_others(user_id)
        joins(:users).where("users.id != ?", user_id).distinct
    end



end
