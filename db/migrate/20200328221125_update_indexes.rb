class UpdateIndexes < ActiveRecord::Migration[6.0]
  def change
    rename_column :project_activities, :activity_value_id, :activity_id
    rename_index :project_activities, :activity_value_id, :activity_id

    rename_column :projects, :status_value_id, :status_id
    rename_index :projects, :status_value_id, :status_id

    rename_column :projects, :payment_method_value_id, :payment_method_id
    rename_index :projects, :payment_method_value_id, :payment_method_id

  end
end
