class UpdateTasks < ActiveRecord::Migration[6.0]
  def change
    # remove_foreign_key :tasks, :task_category
    add_reference :tasks, :project, foreign_key: true
    add_column :tasks, :group, :string
    add_column :tasks, :done, :boolean
    remove_column :tasks, :task_category

    drop_table :project_tasks
  end
end
