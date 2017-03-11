class Plan < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :plan_charges

  extend Enumerize
  enumerize :status, in: [:live, :over], default: :live

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, :category_id, presence: true
  validate :plan_charges_amount_sum_should_be_less_than_amount

  after_save :update_balance_planned_amount

  # TODO: write validation that amount sholdn't be 0!
  # TODO: write validation that plan_charges.sum(:amount) should be less than amount

  def progress_percentage
    plan_charges.sum(:amount) * 100 / amount
  end

  private
  def plan_charges_amount_sum_should_be_less_than_amount
    if plan_charges.sum(:amount) > balance.amount
      errors.add(:plan_charges, "should be less than amount money needed to complete the plan")
    end
  end

  def update_balance_planned_amount
    balance = user.balance
    current_planned_amount = balance.planned_amount

    user.balance.update_attribute(:planned_amount, current_planned_amount + amount)
  end
end
