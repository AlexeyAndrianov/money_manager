class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.date :operation_date
      t.float :amount
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
