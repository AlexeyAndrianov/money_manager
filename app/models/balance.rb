class Balance < ActiveRecord::Base
  belongs_to :user
  has_many :charges
  # add column money_charged (sum of all charges)
  # add column money_spent
  # add callback after_create to Charge that updates money_charged for Balance
  # add callback after_save when Plan is completed update money_spent for Balance

  validates :amount, :planned_amount, numericality: { greater_than_or_equal_to: 0 }

  def free_amount
    amount - planned_amount
  end

end
