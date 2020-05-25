class DropTaskCategoryTable < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :tasks, :task_categories
    remove_column :tasks, :task_category_id
    drop_table :task_categories
  end
end
