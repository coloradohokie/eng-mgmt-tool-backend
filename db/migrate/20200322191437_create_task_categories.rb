class CreateTaskCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :task_categories do |t|

      t.string :value
      t.integer :sort_id
      t.boolean :active
      t.timestamps
    end
  end
end
