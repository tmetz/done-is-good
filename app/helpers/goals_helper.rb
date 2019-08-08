module GoalsHelper

    def accomplished_status
        if @goal.accomplished
            "Accomplished!"
        else 
            "In progress - #{@goal.percent_complete}% done"
        end 
    end
    
end
