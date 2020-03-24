class CreatePaymentMethodValues < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_method_values do |t|

      t.string :value
      t.integer :sort_id
      t.boolean :active
      t.timestamps
    end
  end
end
