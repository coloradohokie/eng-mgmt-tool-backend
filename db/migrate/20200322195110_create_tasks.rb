class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.text :name
      t.text :template_name
      t.boolean :done
      t.integer :sort_id
      t.boolean :active
      t.timestamps
    end
  end
end
