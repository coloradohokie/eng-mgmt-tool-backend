class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :job_number, null: false
      t.references :status, null: false, foreign_key: true
      t.text :address1, null: false
      t.text :address2
      t.text :city
      t.text :project_description
      t.references :payment_method, null: false, foreign_key: true
      t.references :client, foreign_key: true
      t.integer :budget
      t.date :contract_date
      t.date :st_contract_received_date
      t.date :trusses_received_date
      t.date :framing_due_date
      t.date :foundation_due_date
      t.date :email_from_dwg_received_date
      t.date :contract_proposal_sent_date
      t.boolean :ready_to_be_invoiced
      t.date :ready_to_be_invoiced_date
      t.timestamps
    end
  end
end
