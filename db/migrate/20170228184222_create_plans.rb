class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.float :amount
      t.integer :user_id
      t.integer :category_id
      t.string :status

      t.timestamps null: false
    end
  end
end
