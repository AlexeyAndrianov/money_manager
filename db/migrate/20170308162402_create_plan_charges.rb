class CreatePlanCharges < ActiveRecord::Migration
  def change
    create_table :plan_charges do |t|
      t.float :amount

      t.timestamps null: false
    end

    add_reference :plan_charges, :plan, foreign_key: true
    add_reference :plan_charges, :user, foreign_key: true
  end
end
