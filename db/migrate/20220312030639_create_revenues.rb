class CreateRevenues < ActiveRecord::Migration[6.1]
  def change
    create_table :revenues do |t|
      t.integer :amount, default: 0
      t.integer :head_count, default: 0
      t.text :memo

      t.timestamps
    end
  end
end
