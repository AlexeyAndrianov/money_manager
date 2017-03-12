class Plan < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :category
  has_many :plan_charges

  enumerize :status, in: [:active, :completed], default: :active

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, :category_id, presence: true

  after_save :update_balance_planned_amount

  # TODO: write validation that amount sholdn't be 0!
  # TODO: write validation that plan_charges.sum(:amount) should be less than amount

  def progress_percentage
    plan_charges.sum(:amount) * 100 / amount
  end

  def money_postponed?
    progress_percentage == 100
  end

  private

  def update_balance_planned_amount
    balance = user.balance
    current_planned_amount = balance.planned_amount

    user.balance.update_attribute(:planned_amount, current_planned_amount + amount)
  end
end
