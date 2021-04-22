class RemoveColumnFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :user_id, :integer
    remove_column :tasks, :done, :boolean
  end
end
