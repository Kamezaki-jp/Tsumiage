class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.string :task_name

      t.timestamps
    end
  end
end
