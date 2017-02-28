class AddPlannedAmountToBalance < ActiveRecord::Migration
  def change
    add_column :balances, :planned_amount, :float
  end
end
