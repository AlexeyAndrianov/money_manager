class Balance < ActiveRecord::Base
  belongs_to :user
  has_many :charges

  validates :amount, :planned_amount, numericality: { greater_than_or_equal_to: 0 }

  # validate :check_planned_amount

  def free_amount
    amount - planned_amount
  end

  private

  def check_planned_amount
    errors.add(:planned_amount, "should be equal or less than amount")  if planned_amount > amount
  end
end
