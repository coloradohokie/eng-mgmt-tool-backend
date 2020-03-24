class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :task_category, null: false, foreign_key: true
      t.integer :sort_id
      t.boolean :active
      t.timestamps
    end
  end
end
