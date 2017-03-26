class PlanCharge < ActiveRecord::Base
  belongs_to :plan
  belongs_to :user

  validates :plan_id, presence: true
  validate :check_amount
  validate :plan_charges_amount_sum_should_be_less_than_amount
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  after_commit :update_planned_balance_amount
  after_destroy :update_planned_balance_amount

  private

  def check_amount
    if amount > user.balance.free_amount
      errors.add(:amount, "should be equal or less than amount of balance's free amount")
    end
  end

  def update_planned_balance_amount
    current_planned_amount = PlanCharge.joins(:plan).where(user_id: user.id, plans: { status: :active }).sum(:amount)

    user.balance.update_attribute(:planned_amount, current_planned_amount)
  end

  def plan_charges_amount_sum_should_be_less_than_amount
    if plan.plan_charges.sum(:amount) + amount > plan.amount
      errors.add(:amount, "should be less than plan's money amount")
    end
  end
end
