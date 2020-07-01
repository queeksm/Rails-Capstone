class CreateTransactionGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_groups do |t|
      t.integer :group_id
      t.integer :bdraft_id

      t.timestamps
    end
  end
end
