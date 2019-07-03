class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :done
      t.integer :goal_id
      t.integer :user_id

      t.timestamps
    end
  end
end
