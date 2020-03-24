class CreateProjectTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.boolean :completed
      t.date :completed_date
      t.timestamps
    end
  end
end
