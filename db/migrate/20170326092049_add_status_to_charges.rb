class AddStatusToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :status, :string
  end
end
