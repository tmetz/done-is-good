class Task < ApplicationRecord
    validates :description, presence: true
    
    belongs_to :goal
    belongs_to :user
end
