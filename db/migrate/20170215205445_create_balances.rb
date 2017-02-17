class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.float :amount, default: 0, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
