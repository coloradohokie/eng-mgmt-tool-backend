class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.text :name
      t.text :phone
      t.text :email
      t.timestamps
    end
  end
end
