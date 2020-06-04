class AddLastActionToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :last_action, :string
  end
end
