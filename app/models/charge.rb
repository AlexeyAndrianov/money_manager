class Charge < ActiveRecord::Base
  belongs_to :user

  delegate :balance, to: :user

  after_save :update_balance_amount
  after_destroy :update_balance_amount

  validates :amount, presence: true
  default_scope { order(operation_date: :desc) }

  private

  def update_balance_amount
    balance.update_attribute(:amount, user.charges.sum(:amount))
  end
end
