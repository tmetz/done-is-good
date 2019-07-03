class CreateIncentives < ActiveRecord::Migration[5.2]
  def change
    create_table :incentives do |t|
      t.string :description
      t.integer :goal_id

      t.timestamps
    end
  end
end
