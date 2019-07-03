class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.boolean :accomplished

      t.timestamps
    end
  end
end
