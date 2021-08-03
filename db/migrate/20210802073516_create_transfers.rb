class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.integer :from_warehouse_id, null: false, foreign_key: true
      t.integer :to_warehouse_id, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
