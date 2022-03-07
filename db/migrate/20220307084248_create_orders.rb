class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :order_price, null: false
      t.string :customer_name
      t.string :customer_address
      t.integer :payment_method, default: 0

      t.timestamps
    end
  end
end
