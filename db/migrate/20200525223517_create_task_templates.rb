class CreateTaskTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :task_templates do |t|
      t.string :name
      t.integer :sort_id
      t.boolean :active

      t.timestamps
    end
  end
end
