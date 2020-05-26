class CreateProjectActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :project_activities do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.date :activity_date
      t.text :notes
      t.boolean :important
      t.boolean :archived
      t.timestamps
    end
  end
end
