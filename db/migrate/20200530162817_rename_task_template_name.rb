class RenameTaskTemplateName < ActiveRecord::Migration[6.0]
  def change
    change_table :task_templates do |t|
      t.rename :name, :value
    end
  end
end
