class CreateBdrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :bdrafts do |t|
      t.string :name
      t.integer :user_id
      t.integer :amount
      t.date :date
      t.timestamps
    end
  end
end
