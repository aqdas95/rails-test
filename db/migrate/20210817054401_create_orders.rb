class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :coin
      t.float :amount
      t.string :extra1
      t.string :extra2

      t.timestamps
    end
  end
end
