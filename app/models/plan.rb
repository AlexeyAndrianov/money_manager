class Plan < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :category
  has_many :plan_charges, dependent: :destroy

  enumerize :status, in: [:active, :completed], default: :active

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :amount, numericality:  {greater_than: 0}
  validates :user_id, :category_id, presence: true
#  validates :self.plan_, numericality: {less_than: 100}
#TODO plan_charges.sum should be less than plan.amount
  after_destroy :reduce_balance_after_completion


  def progress_percentage
    plan_charges.sum(:amount) * 100 / amount
  end

  def money_postponed?
    progress_percentage == 100
  end

  def to_completed
    user.charges.create(status: :system, amount: -amount, operation_date: Date.today)

    new_planned_amount = user.balance.planned_amount -= amount
    user.balance.update_attribute(:planned_amount, new_planned_amount)

    self.status = :completed
    self
  end

  private

  def reduce_balance_after_completion
    if status == :active
      current_balance = user.balance.amount

      user.balance.update_attributes(planned_amount: user.balance.planned_amount - amount)
    end
  end
end
