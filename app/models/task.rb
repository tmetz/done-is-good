class Task < ApplicationRecord
    validates :description, presence: true
    
    belongs_to :goal
    belongs_to :user

    accepts_nested_attributes_for :goal

    #scope :order_by_goal, -> {order(:goal.name)}

    scope :order_by_age, -> {order(:created_at)}

    scope :finished, -> {where(done: true)}
    scope :unfinished, -> {where(done: false)}


end
