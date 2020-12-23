class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.text :value
      t.integer :sort_id
      t.boolean :active
      t.timestamps
    end
  end
end
