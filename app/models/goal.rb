class Goal < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    has_many :incentives

    validates :name, :accomplished, presence: true

    scope :finished, -> {where(accomplished: true)}
    scope :unfinished, -> {where(accomplished: false)}

    def percent_complete
        100 * self.tasks.where(done: true).count / self.tasks.count
    end

end
