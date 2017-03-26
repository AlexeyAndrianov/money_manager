class Plan < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :category
  has_many :plan_charges, dependent: :destroy

  enumerize :status, in: [:active, :completed], default: :active

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, :category_id, presence: true

  after_commit :update_balance_planned_amount
  after_destroy :reduce_balance_after_completion

  # TODO: write validation that amount sholdn't be 0!
  # TODO: write validation that plan_charges.sum(:amount) should be less than amount

  def progress_percentage
    plan_charges.sum(:amount) * 100 / amount
  end

  def money_postponed?
    progress_percentage == 100
  end

  def to_completed
    user.charges.create(status: :system, amount: -amount, operation_date: Date.today)

    user.balance.planned_amount -= amount

    self.status = :completed
    self
  end

  private

  def update_balance_planned_amount
    current_planned_amount = PlanCharge.joins(:plan).where(user_id: user.id, plans: { status: :active }).sum(:amount)

    user.balance.update_attribute(:planned_amount, current_planned_amount)
  end

  def reduce_balance_after_completion
    if status == :active
      current_balance = user.balance.amount

      user.balance.update_attributes(planned_amount: user.balance.planned_amount - amount)
    end
  end
end
