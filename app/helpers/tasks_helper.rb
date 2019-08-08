module TasksHelper

    def finished_status
        if @task.done 
            finished = "Yes"
        else 
            finished = "No"
        end
    "Finished? #{finished}"
    end
end
