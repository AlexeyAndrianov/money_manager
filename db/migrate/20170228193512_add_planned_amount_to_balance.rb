class AddPlannedAmountToBalance < ActiveRecord::Migration
  def change
    add_column :balances, :planned_amount, :float, default: 0.0
  end
end
