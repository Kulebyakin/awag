class CreateWarehouses < ActiveRecord::Migration[6.1]
  def change
    create_table :warehouses do |t|
      t.string :title
      t.integer :region

      t.timestamps
    end
  end
end
