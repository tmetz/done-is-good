class AddNumTasksToIncentives < ActiveRecord::Migration[5.2]
  def change
    add_column :incentives, :num_tasks, :integer
  end
end
