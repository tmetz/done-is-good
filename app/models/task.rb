class Task < ApplicationRecord
    validates :description, :done, presence: true
    
    belongs_to :goal
    belongs_to :user
end
