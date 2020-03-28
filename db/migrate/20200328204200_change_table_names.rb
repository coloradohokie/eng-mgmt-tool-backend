class ChangeTableNames < ActiveRecord::Migration[6.0]
  def change
    rename_table :activities, :project_activities
    rename_table :activity_values, :activities
    rename_table :payment_method_values, :payment_methods
    rename_table :status_values, :statuses

  end
end
