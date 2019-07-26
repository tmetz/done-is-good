class Goal < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks
    has_many :incentives

    scope :finished, -> {where(accomplished: true)}
    scope :unfinished, -> {where(accomplished: false)}

end
